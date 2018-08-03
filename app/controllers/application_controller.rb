class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_reviews = user.reviews.count
  end
  
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
