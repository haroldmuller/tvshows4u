require 'test_helper'

class FavShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fav_show = fav_shows(:one)
  end

  test "should get index" do
    get fav_shows_url
    assert_response :success
  end

  test "should get new" do
    get new_fav_show_url
    assert_response :success
  end

  test "should create fav_show" do
    assert_difference('FavShow.count') do
      post fav_shows_url, params: { fav_show: { favorite: @fav_show.favorite, tv_show_id: @fav_show.tv_show_id, user_id: @fav_show.user_id } }
    end

    assert_redirected_to fav_show_url(FavShow.last)
  end

  test "should show fav_show" do
    get fav_show_url(@fav_show)
    assert_response :success
  end

  test "should get edit" do
    get edit_fav_show_url(@fav_show)
    assert_response :success
  end

  test "should update fav_show" do
    patch fav_show_url(@fav_show), params: { fav_show: { favorite: @fav_show.favorite, tv_show_id: @fav_show.tv_show_id, user_id: @fav_show.user_id } }
    assert_redirected_to fav_show_url(@fav_show)
  end

  test "should destroy fav_show" do
    assert_difference('FavShow.count', -1) do
      delete fav_show_url(@fav_show)
    end

    assert_redirected_to fav_shows_url
  end
end
