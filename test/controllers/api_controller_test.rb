require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_show_url
    assert_response :success
  end

end
