# encoding: utf-8
require 'pp'
require 'csv'
WORKING_DIR = File.dirname(__FILE__)

namespace :import do
  
  task :products => :environment do
    CSV.foreach("#{WORKING_DIR}/northwind.sql") do |row|
      category = Category.find(row[12])
      product = {
        :name           => row[10].strip[1..-2],
        :description    => row[13].strip[1..-2],
        :price          => BigDecimal.new(row[14]),
        :stock_quantity => row[15].to_i,
        :category       => category
      }
      Product.create(product)
    end
  end
  
  task :categories => :environment do
    File.foreach("#{WORKING_DIR}/category.csv") do |line|
      row = line.split('|')
      category = { :name => row[0], :description => row[1] }
      Category.create(category)
    end
  end
  
  task :customers => :environment do
    PROVINCES = %w{AB BC MB NB NL NT NS NU ON PE QC SK YT}
    
    PROVINCES.each do |p|
      print "Importing #{p} "
      count = 0
      province = Province.find_by_code(p)
      CSV.foreach("#{WORKING_DIR}/#{p}_data.csv", { :col_sep => '|'}) do |row|
        customer = {
          :name        => row[0],
          :email       => row[1],
          :address     => row[2],
          :city        => row[3],
          :postal_code => row[4],
          :country     => row[6],
          :province    => province
        }
        Customer.create(customer)
        count += 1
      end
      puts count
    end
  end
  
  task :provinces => :environment do
    provinces = [
      {
        :name => 'Alberta',
        :code => 'AB',
        :pst  => 0,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'British Columbia',
        :code => 'BC',
        :pst  => 0,
        :gst  => 0,
        :hst  => 0.12,
        :home_province => false
      },
      {
        :name => 'Manitoba',
        :code => 'MB',
        :pst  => 0.07,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'New Brunswick',
        :code => 'NB',
        :pst  => 0,
        :gst  => 0,
        :hst  => 0.13,
        :home_province => false
      },
      {
        :name => 'Newfoundland and Labrador',
        :code => 'NL',
        :pst  => 0,
        :gst  => 0,
        :hst  => 0.13,
        :home_province => false
      },
      {
        :name => 'Northwest Territories',
        :code => 'NT',
        :pst  => 0,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'Nova Scotia',
        :code => 'NS',
        :pst  => 0,
        :gst  => 0,
        :hst  => 0.15,
        :home_province => false
      },
      {
        :name => 'Nunavut',
        :code => 'NU',
        :pst  => 0,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'Ontario',
        :code => 'ON',
        :pst  => 0,
        :gst  => 0,
        :hst  => 0.13,
        :home_province => false
      },
      {
        :name => 'Prince Edward Island',
        :code => 'PE',
        :pst  => 0.1,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'Quebec',
        :code => 'QC',
        :pst  => 0.075,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'Saskatchewan',
        :code => 'SK',
        :pst  => 0.05,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
      {
        :name => 'Yukon',
        :code => 'YT',
        :pst  => 0,
        :gst  => 0.05,
        :hst  => 0,
        :home_province => false
      },
    ]
    provinces.each do |province|
      Province.create(province)
    end
  end
end
