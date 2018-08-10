require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
class SpotsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @spots = []
    @keyword = params[:keyword]
    if @keyword
      base_url  = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
      query_url = "&query=#{params[:keyword]}"
      api_key_url  = "&key=#{ENV['GOOGLE_API_KEY']}"
      language_url = "&language=ja"
      
      test = (base_url + query_url + api_key_url + language_url)
      enc_str = URI.encode test
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      results = JSON.parse(json)
      results = results['results']
        results.each do |result|
          begin
            spot = Spot.find_or_initialize_by(place_id: result['place_id'])
              unless spot.persisted?
                  spot = Spot.new(read(result))
              end
            @spots << spot
          rescue
            next
          end
        end
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @spot_review = @spot.reviews.page(params[:page]).per(10)
    @count_like = @spot.like_users.count
    @count_good = @spot.good_users.count
  end
  
end
