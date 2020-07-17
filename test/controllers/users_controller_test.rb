require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "新規登録 | Campus Tweets"
  end 

  # test "should get create" do
  #   get create_path
  #   assert_response :success
  # end 

end
