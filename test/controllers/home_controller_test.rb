require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title", "Campus Tweets"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Q&A | Campus Tweets"
  end 

end
