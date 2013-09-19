#encoding: UTF-8
require 'csv'
namespace :seed do
  desc "Import geografy data from csv file"
  task :countries => :environment do
    puts "Seeding countries"
      Country.delete_all
      CSV.foreach( File.expand_path("../geo_seed/country_u.csv", __FILE__), :headers => true, :col_sep => ";") do |row|
        puts row
        Country.create!(row.to_hash)
      end
  end

  desc "TODO"
  task :region => :environment do
      Region.delete_all
      CSV.foreach( File.expand_path("../geo_seed/region_u.csv", __FILE__), :headers => true, :col_sep => ";") do |row|
        puts row
        Region.create!(row.to_hash)
      end
  end

  desc "TODO"
  task :city => :environment do
      City.delete_all
      CSV.foreach( File.expand_path("../geo_seed/city_u.rb", __FILE__), :headers => true, :col_sep => ";") do |row|
        City.create!(row.to_hash)
      end
  end
  
  desc "Seed geo data from file"
  task :all => :environment do
      puts "Seeding countries"
      Country.delete_all
      CSV.foreach( File.expand_path("../geo_seed/country_u.csv", __FILE__), :headers => true, :col_sep => ";") do |row|
        puts row
        Country.create!(row.to_hash)
      end
      
      puts "Seeding region"
      Region.delete_all
      CSV.foreach( File.expand_path("../geo_seed/region_u.csv", __FILE__), :headers => true, :col_sep => ";") do |row|
        puts row
        Region.create!(row.to_hash)
      end
      
      puts "Seeding cities"
      City.delete_all
      CSV.foreach( File.expand_path("../geo_seed/city_u.rb", __FILE__), :headers => true, :col_sep => ";") do |row|
        City.create!(row.to_hash)
      end
  end

  desc "Seed reester object data"
  task reester_object: :environment do
    
  end

end
