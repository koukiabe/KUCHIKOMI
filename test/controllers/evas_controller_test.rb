require 'test_helper'

class EvasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get evas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get evas_destroy_url
    assert_response :success
  end

end
