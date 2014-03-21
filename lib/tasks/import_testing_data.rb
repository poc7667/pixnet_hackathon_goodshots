# # encoding: utf-8
# desc "Import translates."
# # http://robots.thoughtbot.com/post/18070048430/anonymizing-customer-company-and-location-data-using
# namespace :import do
#     task :json => :environment do

#     end
# end
require 'pry'
require 'json'
require 'awesome_print'

def load_json(file_name)
    File.open(file_name, "r") do |f|
        return JSON.load(f)
    end
end

load_json('15.json').each_with_index do | item , i|
    break if i > 10    
    ap(item["medium"])
end