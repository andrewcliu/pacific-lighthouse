require "sinatra"
require 'sass'
require 'builder'




set :server, :puma
set :public_folder, File.dirname(__FILE__) + '/public'

get '/styles.css' do
  scss :styles
end

get "/" do
	erb:'main', layout: :layout
end

get '/food_menu' do 
	erb:'food_menu', layout: :layout
end

get '/dim_sum_menu' do 
	erb:'dim_sum_menu', layout: :layout
end

get '/banquet_menu' do 
	erb:'banquet_menu', layout: :layout
end
 
get '/contact' do 
	erb:'contact', layout: :layout
end

get '/catering' do 
	erb:'catering', layout: :layout
end

get '/careers' do 
	erb:'careers', layout: :layout
end


get '/sitemap.xml' do
  content_type 'application/xml'
	production_url = 'https://www.pacificlighthouse88.com'
	urls = ['food_menu', 'dim_sum_menu', 'banquet_menu', 'contact', 'catering','careers']
  builder do |xml|
    xml.instruct! :xml, version: '1.0'
    xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
      # Add URLs to your sitemap dynamically based on your application's routes
      urls.each do |url|
	      xml.url do
	        xml.loc production_url + '/' + url
	        xml.lastmod Time.now.strftime('%Y-%m-%dT%H:%M:%S%:z')
	        xml.changefreq 'weekly'
	        xml.priority '1.0'
	      end
	    end
      # Add more URLs as needed
    end
  end
end