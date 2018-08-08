require 'test_helper'

class ResReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get res_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get res_reviews_destroy_url
    assert_response :success
  end

end
