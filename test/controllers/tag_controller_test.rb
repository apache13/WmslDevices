require 'test_helper'

class TagControllerTest < ActionDispatch::IntegrationTest
  test "should get print" do
    get tag_print_url
    assert_response :success
  end

end
