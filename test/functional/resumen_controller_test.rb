require 'test_helper'

class ResumenControllerTest < ActionController::TestCase
  test "should get museo" do
    get :museo
    assert_response :success
  end

end
