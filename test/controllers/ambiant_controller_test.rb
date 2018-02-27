require 'test_helper'

class AmbiantControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ambiant_show_url
    assert_response :success
  end

end
