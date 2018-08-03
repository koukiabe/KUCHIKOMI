class FavoriteSpotsController < ApplicationController
  
  def create
    @spot = Spot.find_or_initialize_by(place_id: params[:place_id])
    
    unless @spot.persisted?
      detail_url = "https://maps.googleapis.com/maps/api/place/details/json?"
      placeid_url = "&placeid=#{params[:place_id]}"
      api_key_url  = "&key=#{ENV['GOOGLE_API_KEY']}"
      language_url = "&language=ja"
      
        uri = URI.parse(detail_url + placeid_url + api_key_url + language_url)
        json = Net::HTTP.get(uri)
        results = JSON.parse(json)
        result = results['result']
          begin
            @spot = Spot.new(detail(result))
          rescue
            @spot = Spot.new(read(result))
          end
          @spot.save
            
        @photos = []
      photo_url = "https://maps.googleapis.com/maps/api/place/photo?"
      max_url = "maxwidth=400&maxheight=400"
      refe_url = "&photoreference=#{@spot.photo_reference}"

        uri = URI.parse(photo_url + max_url + refe_url + api_key_url)
        photo = Net::HTTP.get(uri)
        result = Nokogiri::HTML(photo)
        @photos = @spot.build_spot_photo(spot_id: @spot.id, photo_url: result.at('//a').[]('href'))
        @photos.save
    end
    
    if params[:type] == 'Good'
      current_user.good(@spot)
      flash[:success] = '良かった！に登録しました。'
    end

    redirect_back(fallback_location: root_path)
    
  end

  def destroy
    @spot = Spot.find(params[:spot_id])

    if params[:type] == 'Good'
      current_user.ungood(@spot) 
      flash[:danger] = '良かった！を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
  
end
