require 'test_helper'

class FavoriteSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_spots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_spots_destroy_url
    assert_response :success
  end

end
