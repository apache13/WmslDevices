require 'test_helper'

class WmsldevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wmsldevices_index_url
    assert_response :success
  end

end
