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
        if loc["geojson"].has_key? "coordinates"
          item["lon"] = loc["geojson"]["coordinates"][0]
          item["lat"] = loc["geojson"]["coordinates"][1]
          item["lonlat"] = "#{item['lon']} #{item['lat']}"
        end
      end
    end

    def rename_hash_key(item)
      keys = item.keys.dup
      keys.each_with_index do |key, i|
        new_key = key.downcase
        item[new_key] = item[key].dup
        item.delete(key)
      end
    end

    load_json('15.json').each_with_index do | item , i|
      break if i > 0

      img = Image.new
      binding.pry

      rename_hash_key(item)

      if item.has_key? "id"
        item['picture_id'] = item['id']
        item.delete('id')
      end

      add_EXIF_related(item)
      location_related(item)

    end


    class Xls < ActiveRecord::Base

      output = []
      return unless ARGV[0]

      xls = Roo::Excel.new(ARGV[0])
      xls.default_sheet = xls.sheets[0]

      2.upto(100) do |row_no|
        r = xls.row(row_no)
        break if  r[0]==nil

        r[0] = r[0].underscore
        case r[1]
        when nil
          output << "#{r[0]}:text "
        when "hash"
          output << "#{r[0]}:hstore "
        else
          output << "#{r[0]}:#{r[1]} "
        end
      end

      print output.join(' ')
    end

    Xls







  end
end
