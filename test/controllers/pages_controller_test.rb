require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get biography" do
    get pages_biography_url
    assert_response :success
  end

  test "should get contacts" do
    get pages_contacts_url
    assert_response :success
  end

  test "should get writing" do
    get pages_writing_url
    assert_response :success
  end

  test "should get photography" do
    get pages_photography_url
    assert_response :success
  end

  test "should get music" do
    get pages_music_url
    assert_response :success
  end

  test "should get development" do
    get pages_development_url
    assert_response :success
  end
end
