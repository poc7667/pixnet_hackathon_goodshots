# encoding: utf-8
# desc "Import translates."
# # http://robots.thoughtbot.com/post/18070048430/anonymizing-customer-company-and-location-data-using
# namespace :import do
#     task :json => :environment do

#     end
# end
p ARGV[0]
require 'pry'
require 'json'
require 'roo'
require 'awesome_print'
require'active_record'

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

class Xls < ActiveRecord::Base

    output = []
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

abort("bye")

def load_json(file_name)
    File.open(file_name, "r") do |f|
        return JSON.load(f)
    end
end

load_json('15.json').each_with_index do | item , i|
    break if i > 0    
    item.each do | key, value|
        puts key.gsub('"', '')
    end
end