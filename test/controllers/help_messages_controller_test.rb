require "test_helper"

class HelpMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get help_messages_new_url
    assert_response :success
  end

  test "should get create" do
    get help_messages_create_url
    assert_response :success
  end
end
