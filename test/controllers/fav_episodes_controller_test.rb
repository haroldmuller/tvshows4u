require 'test_helper'

class FavEpisodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fav_episode = fav_episodes(:one)
  end

  test "should get index" do
    get fav_episodes_url
    assert_response :success
  end

  test "should get new" do
    get new_fav_episode_url
    assert_response :success
  end

  test "should create fav_episode" do
    assert_difference('FavEpisode.count') do
      post fav_episodes_url, params: { fav_episode: { episode_id: @fav_episode.episode_id, favorite: @fav_episode.favorite, user_id: @fav_episode.user_id } }
    end

    assert_redirected_to fav_episode_url(FavEpisode.last)
  end

  test "should show fav_episode" do
    get fav_episode_url(@fav_episode)
    assert_response :success
  end

  test "should get edit" do
    get edit_fav_episode_url(@fav_episode)
    assert_response :success
  end

  test "should update fav_episode" do
    patch fav_episode_url(@fav_episode), params: { fav_episode: { episode_id: @fav_episode.episode_id, favorite: @fav_episode.favorite, user_id: @fav_episode.user_id } }
    assert_redirected_to fav_episode_url(@fav_episode)
  end

  test "should destroy fav_episode" do
    assert_difference('FavEpisode.count', -1) do
      delete fav_episode_url(@fav_episode)
    end

    assert_redirected_to fav_episodes_url
  end
end
