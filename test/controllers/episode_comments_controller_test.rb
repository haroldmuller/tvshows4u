require 'test_helper'

class EpisodeCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @episode_comment = episode_comments(:one)
  end

  test "should get index" do
    get episode_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_episode_comment_url
    assert_response :success
  end

  test "should create episode_comment" do
    assert_difference('EpisodeComment.count') do
      post episode_comments_url, params: { episode_comment: { content: @episode_comment.content, episode_id: @episode_comment.episode_id, user_id: @episode_comment.user_id } }
    end

    assert_redirected_to episode_comment_url(EpisodeComment.last)
  end

  test "should show episode_comment" do
    get episode_comment_url(@episode_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_episode_comment_url(@episode_comment)
    assert_response :success
  end

  test "should update episode_comment" do
    patch episode_comment_url(@episode_comment), params: { episode_comment: { content: @episode_comment.content, episode_id: @episode_comment.episode_id, user_id: @episode_comment.user_id } }
    assert_redirected_to episode_comment_url(@episode_comment)
  end

  test "should destroy episode_comment" do
    assert_difference('EpisodeComment.count', -1) do
      delete episode_comment_url(@episode_comment)
    end

    assert_redirected_to episode_comments_url
  end
end
