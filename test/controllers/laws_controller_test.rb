require 'test_helper'

class LawsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get laws_new_url
    assert_response :success
  end

  test "should get create" do
    get laws_create_url
    assert_response :success
  end

  test "should get destroy" do
    get laws_destroy_url
    assert_response :success
  end

end
