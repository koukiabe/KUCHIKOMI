require 'test_helper'

class SpotPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get spot_photos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get spot_photos_destroy_url
    assert_response :success
  end

end
