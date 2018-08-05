require 'test_helper'

class RefsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get refs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get refs_destroy_url
    assert_response :success
  end

end
