require 'test_helper'

class ImportDataControllerTest < ActionController::TestCase
  test "should get import_data" do
    get :import_data
    assert_response :success
  end

end
