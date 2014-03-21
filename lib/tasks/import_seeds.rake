# encoding: utf-8
desc "Import seeds"
namespace :import do
  task :seeds => :environment do

    require 'pry'
    require 'json'
    require 'roo'
    require 'awesome_print'
    require 'active_record'

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
        ap(exif.class)
        if exif.has_key? exif_key
          new_exif_key = exif_key.underscore
          item[new_exif_key] = exif[exif_key]
          item.delete(exif_key)
        end
      end
    end


    def location_related(item)
      loc = item["location"]
      item['city'] = loc["city"] if loc.has_key? "city"
      if loc.has_key? "geojson"
        # if loc["geojson"].has_key? "coordinates"
          item["lon"] = loc["geojson"]["coordinates"][0]
          item["lat"] = loc["geojson"]["coordinates"][1]
          item["lonlat"] = "POINT(#{item['lon']} #{item['lat']})"
          item["lon"] = "POINT(#{item['lon']})"
          item["lat"] = "POINT(#{item['lat']})"
        # end
      end
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
    end
    def clean_hash_key(item)
      if item.include? "type"
        item.delete("type")
      end
    end

    #===================

    load_json('lib/tasks/15.json').each_with_index do | item , i|
      begin

        break if i > 0
        rename_hash_key(item)
        clean_hash_key(item)

        if item.has_key? "id"
          item['image_id'] = item['id']
          item.delete('id')
        end

        add_EXIF_related(item)
        location_related(item)

        test_hash = {}
        item.each_with_index do |(key, value), index|
          break if index > 15
          test_hash[key] = item[key]
        end
        binding.pry
        img = Image.new(item)
        binding.pry

      rescue Exception => e
        ap(item)
        raise e  # not enough lifeboats ;)
      end


    end

  end
end
