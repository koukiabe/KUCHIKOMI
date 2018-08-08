class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :reviews
  has_many :res_reviews
  has_many :spots, through: :reviews
  has_many :restaurants, through: :res_reviews

  has_many :favorite_spots
  has_many :spots, through: :favorite_spots
  has_many :goods
  has_many :good_spots, through: :goods, class_name: 'Spot', source: :spot
  has_many :likes
  has_many :like_spots, through: :likes, class_name: 'Spot', source: :spot
  
  has_many :refs, dependent: :destroy
  has_many :ref_reviews, through: :refs, source: :review
  has_many :evas, dependent: :destroy
  has_many :eva_reviews, through: :evas, source: :res_review
  
  has_many :favorite_restaurants
  has_many :restaurants, through: :favorite_restaurants
  has_many :nices, class_name: 'Nice'
  has_many :nice_restaurants, through: :nices, class_name: 'Restaurant', source: :restaurant
  has_many :cons
  has_many :con_restaurants, through: :cons, class_name: 'Restaurant', source: :restaurant
  
  def good(spot)
    self.goods.find_or_create_by(spot_id: spot.id)
  end

  def ungood(spot)
    good = self.goods.find_by(spot_id: spot.id)
    good.destroy if good
  end

  def good?(spot)
    self.good_spots.include?(spot)
  end
  
  def like(spot)
    self.likes.find_or_create_by(spot_id: spot.id)
  end

  def unlike(spot)
    like = self.likes.find_by(spot_id: spot.id)
    like.destroy if like
  end

  def like?(spot)
    self.like_spots.include?(spot)
  end
  
  def ref(review)
    self.refs.find_or_create_by(review_id: review.id)
  end

  def unref(review)
    ref = self.refs.find_by(review_id: review.id)
    ref.destroy if ref
  end
  
  def ref?(review)
    self.ref_reviews.include?(review)
  end
  
  def nice(restaurant)
    self.nices.find_or_create_by(restaurant_id: restaurant.id)
  end

  def unnice(restaurant)
    nice = self.nices.find_by(restaurant_id: restaurant.id)
    nice.destroy if nice
  end

  def nice?(restaurant)
    self.nice_restaurants.include?(restaurant)
  end
  
  def con(restaurant)
    self.cons.find_or_create_by(restaurant_id: restaurant.id)
  end

  def uncon(restaurant)
    con = self.cons.find_by(restaurant_id: restaurant.id)
    con.destroy if con
  end

  def con?(restaurant)
    self.con_restaurants.include?(restaurant)
  end
  
  def eva(review)
    self.evas.find_or_create_by(res_review_id: review.id)
  end

  def uneva(review)
    eva = self.evas.find_by(res_review_id: review.id)
    eva.destroy if eva
  end
  
  def eva?(review)
    self.eva_reviews.include?(review)
  end
  
end
