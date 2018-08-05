require 'test_helper'

class RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get good" do
    get rankings_good_url
    assert_response :success
  end

  test "should get like" do
    get rankings_like_url
    assert_response :success
  end

end
