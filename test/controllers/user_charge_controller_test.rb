require 'test_helper'

class UserChargeControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get user_charge_update_url
    assert_response :success
  end

end
