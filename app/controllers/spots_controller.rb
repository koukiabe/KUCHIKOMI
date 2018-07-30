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
    if @keyword.present?
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
            spot = Spot.new(read(result))
            @spots << spot
            rescue
            next
          end
        end
    end
  end

  def show
    # name, formatted_adress, place_id, weekday_text, photo_referenceの取得
    @spots = []
    detail_url = "https://maps.googleapis.com/maps/api/place/details/json?"
    placeid_url = "&placeid=#{params[:place_id]}"
    api_key_url  = "&key=#{ENV['GOOGLE_API_KEY']}"
    language_url = "&language=ja"

      uri = URI.parse(detail_url + placeid_url + api_key_url + language_url)
      json = Net::HTTP.get(uri)
      results = JSON.parse(json)
      result = results['result']
        begin
          spot = Spot.new(detail(result))
        rescue
          spot = Spot.new(read(result))
        end
          @spots << spot
    # photo_urlの取得
      photo = result['photos'][0]['photo_reference']
    @photos = []
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?"
    max_url = "maxwidth=400&maxheight=400"
    refe_url = "&photoreference=#{photo}"
    
      uri = URI.parse(photo_url + max_url + refe_url + api_key_url)
      photo = Net::HTTP.get(uri)
      result = Nokogiri::HTML(photo)
        @photos << result.at('//a').[]('href')
      
  end

  def new
  end

  def create
  end
  
  
  private

  def read(result)
        place_id = result['place_id']
        formatted_address = result['formatted_address']
        name = result['name']
        photo_reference = result['photos'][0]['photo_reference']
      
        return{
          place_id: place_id,
          formatted_address: formatted_address,
          name: name,
          photo_reference: photo_reference,
        }
  end
  
  def detail(result)
        place_id = result['place_id']
        formatted_address = result['formatted_address']
        name = result['name']
        photo_reference = result['photos'][0]['photo_reference']
        weekday_text = result['opening_hours']['weekday_text']
        
        return{
          place_id: place_id,
          formatted_address: formatted_address,
          name: name,
          photo_reference: photo_reference,
          weekday_text: weekday_text,
        }
  end
  
  def photo(result)
        photo_url = result.at('//a').[]('href')
        
        return{
          photo_url: photo_url,
        }
  end
  
end
