# encoding: utf-8
desc "Import seeds"
namespace :import do
  task :seeds => :environment do

    require 'pry'
    require 'json'
    require 'roo'
    require 'awesome_print'
    require 'active_record'
    require 'date'

    #reset database
    Image.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!(:images)

    class String
      def underscore
        self.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
      end
    end

    def load_json(file_name)
      File.open(file_name, "r") do |f|
        return JSON.load(f)
      end
    end

    def add_EXIF_related(item)
      exif = item["exif"]

      items =[
        "FocalLength",
        "DateTaken",
        "Aperture",
        "Camera",
        "MeteringMode",
        "ISOSpeedRatings",
      ]
      items.each_with_index do |exif_key, i|
        if exif.has_key? exif_key
          new_exif_key = exif_key.underscore
          if exif[exif_key].kind_of?(Array)
            item[new_exif_key] = exif[exif_key].first
          else
            item[new_exif_key] = exif[exif_key]
          end
          item.delete(exif_key)
        end
      end
    end


    def location_related(item)
      loc = item["location"]
      item['city'] = loc["city"] if loc.has_key? "city"
      if loc.has_key? "geojson"
        # if loc["geojson"].has_key? "coordinates"
          item["lon"] = loc["geojson"]["coordinates"][0].to_f
          item["lat"] = loc["geojson"]["coordinates"][1].to_f
          item["lonlat"] = "POINT(#{item['lon']} #{item['lat']})"
          item["lon_f"] = item["lon"].to_f
          item["lon"] = "POINT(#{item['lon']})"
          item["lat_f"] = item["lat"].to_f
          item["lat"] = "POINT(#{item['lat']})"
        # end
      end
    end

    def get_data_time(str_time, t_format)
    end

    def rename_hash_key(item)
      keys = item.keys.dup
      keys.each_with_index do |key, i|
        new_key = key.downcase
        if new_key != key.downcase
          item[new_key] = item[key].dup
          item.delete(key)
        end
      end
      # item.delete('tags')
    end
    def clean_hash_key(item)
      if item.include? "type"
        item.delete("type")
      end
    end

    def update_tags(item)
      tags = item["tags"].join(" ")
      item["image_tags"] = tags
      item.delete("tags")
    end

    #===================
    start_time = Time.now
    
    json_file_paths = []
    Find.find('lib/tasks/total_data/') do |path|
    json_file_paths << path if path =~ /.*\.json$/
    end

    json_file_paths.each do | file_path |

      ap(file_path)

      load_json(file_path).each_with_index do | item , i|
        begin

          rename_hash_key(item)
          clean_hash_key(item)

          if item.has_key? "id"
            item['image_id'] = item['id']
            item.delete('id')
          end

          add_EXIF_related(item)
          location_related(item)
          update_tags(item)
          
          if item['taken_at']==nil
            next
          end

          begin
            taken_at = Time.at(item['taken_at'].to_i).utc.localtime.to_datetime
            item['month'] = taken_at.month
            item['hour'] = taken_at.hour
          rescue Exception => e
            p("error")
            ap item.inspect
          end

          img = Image.create(item)

        rescue Exception => e
          ap(item)
          ap(e)
          raise e  # not enough lifeboats ;)
        end
      end      
      
    end


    p(Time.now-start_time)

  end
end
