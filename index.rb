require "sinatra"
require 'sass'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/styles.css' do
  scss :styles
end

get "/" do
	redirect to '/index'
end

get '/index' do 
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