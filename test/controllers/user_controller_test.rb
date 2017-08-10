require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get user_name:string_url
    assert_response :success
  end

  test "should get phone:string" do
    get user_phone:string_url
    assert_response :success
  end

  test "should get email:string" do
    get user_email:string_url
    assert_response :success
  end

  test "should get password:string" do
    get user_password:string_url
    assert_response :success
  end

  test "should get twitter:string" do
    get user_twitter:string_url
    assert_response :success
  end

  test "should get facebook:string" do
    get user_facebook:string_url
    assert_response :success
  end

  test "should get google:string" do
    get user_google:string_url
    assert_response :success
  end

end
