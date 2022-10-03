require "test_helper"

class Public::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_images_index_url
    assert_response :success
  end

  test "should get new" do
    get public_post_images_new_url
    assert_response :success
  end

  test "should get show" do
    get public_post_images_show_url
    assert_response :success
  end
end
