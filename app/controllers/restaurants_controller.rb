require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
class RestaurantsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @restaurants = []
    @keyword = params[:keyword]
    if @keyword
      base_url  = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
      query_url = "&query=#{params[:keyword]}"
      type_url = "&types=restaurant"
      api_key_url  = "&key=#{ENV['GOOGLE_API_KEY']}"
      language_url = "&language=ja"
      
      test = (base_url + query_url + type_url + api_key_url + language_url)
      enc_str = URI.encode test
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      results = JSON.parse(json)
      # p "====================="
      # p results 
      results = results['results']
        results.each do |result|
          begin
          # binding.pry
            restaurant = Restaurant.find_or_initialize_by(place_id: result['place_id'])
            # p "====================="
            # p restaurant
              unless restaurant.persisted?
                  restaurant = Restaurant.new(read(result))
              end
            @restaurants << restaurant
          rescue
            next
          end
        end
    end
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_review = @restaurant.res_reviews.page(params[:page]).per(10)
    @count_con = @restaurant.con_users.count
    @count_nice = @restaurant.nice_users.count
  end
  
end
