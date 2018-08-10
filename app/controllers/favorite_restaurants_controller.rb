class FavoriteRestaurantsController < ApplicationController
  
  def create
    @restaurant = Restaurant.find_or_initialize_by(place_id: params[:place_id])
    
    unless @restaurant.persisted?
      detail_url = "https://maps.googleapis.com/maps/api/place/details/json?"
      placeid_url = "&placeid=#{params[:place_id]}"
      api_key_url  = "&key=#{ENV['GOOGLE_API_KEY']}"
      language_url = "&language=ja"
      
        uri = URI.parse(detail_url + placeid_url + api_key_url + language_url)
        json = Net::HTTP.get(uri)
        results = JSON.parse(json)
        result = results['result']
          begin
            @restaurant = Restaurant.new(detail(result))
          rescue
            @restaurant = Restaurant.new(read(result))
          end
          @restaurant.save
            
        @photos = []
      photo_url = "https://maps.googleapis.com/maps/api/place/photo?"
      max_url = "maxwidth=400&maxheight=400"
      refe_url = "&photoreference=#{@restaurant.photo_reference}"

        uri = URI.parse(photo_url + max_url + refe_url + api_key_url)
        photo = Net::HTTP.get(uri)
        result = Nokogiri::HTML(photo)
        @photos = @restaurant.build_restaurant_photo(restaurant_id: @restaurant.id, photo_url: result.at('//a').[]('href'))
        @photos.save
    end
    
    case params[:type]
    when 'Nice'
      current_user.nice(@restaurant)
      flash[:success] = '良かった！に登録しました。'
    when 'Con'
      current_user.con(@restaurant)
      flash[:success] = '気になる！に登録しました。'
    end
    
    redirect_back(fallback_location: root_path)
    
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    
    case params[:type]
    when 'Nice'
      current_user.unnice(@restaurant)
      flash[:danger] = '良かった！を解除しました。'
    when 'Con'
      current_user.uncon(@restaurant)
      flash[:danger] = '気になる！を解除しました。'
    end
    
    redirect_back(fallback_location: root_path)
    
  end
  
end
