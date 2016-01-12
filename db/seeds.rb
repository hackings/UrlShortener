# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
ActiveRecord::Base.transaction do
  CSV.foreach("test/fixtures/urls.csv") do |row|
    short_url = V1::ShortUrl.create( url: row )
    puts "creating -- #{short_url.inspect}"
  end
end   
