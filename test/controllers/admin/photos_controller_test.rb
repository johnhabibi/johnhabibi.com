require "test_helper"

class Admin::PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_photos_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_photos_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_photos_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_photos_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_photos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_photos_destroy_url
    assert_response :success
  end
end
