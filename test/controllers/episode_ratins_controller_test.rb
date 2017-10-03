require 'test_helper'

class EpisodeRatinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @episode_ratin = episode_ratins(:one)
  end

  test "should get index" do
    get episode_ratins_url
    assert_response :success
  end

  test "should get new" do
    get new_episode_ratin_url
    assert_response :success
  end

  test "should create episode_ratin" do
    assert_difference('EpisodeRatin.count') do
      post episode_ratins_url, params: { episode_ratin: { episode_id: @episode_ratin.episode_id, favorite: @episode_ratin.favorite, rating: @episode_ratin.rating, seen: @episode_ratin.seen, user_id: @episode_ratin.user_id } }
    end

    assert_redirected_to episode_ratin_url(EpisodeRatin.last)
  end

  test "should show episode_ratin" do
    get episode_ratin_url(@episode_ratin)
    assert_response :success
  end

  test "should get edit" do
    get edit_episode_ratin_url(@episode_ratin)
    assert_response :success
  end

  test "should update episode_ratin" do
    patch episode_ratin_url(@episode_ratin), params: { episode_ratin: { episode_id: @episode_ratin.episode_id, favorite: @episode_ratin.favorite, rating: @episode_ratin.rating, seen: @episode_ratin.seen, user_id: @episode_ratin.user_id } }
    assert_redirected_to episode_ratin_url(@episode_ratin)
  end

  test "should destroy episode_ratin" do
    assert_difference('EpisodeRatin.count', -1) do
      delete episode_ratin_url(@episode_ratin)
    end

    assert_redirected_to episode_ratins_url
  end
end
