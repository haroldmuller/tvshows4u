require 'test_helper'

class TvShowCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tv_show_comment = tv_show_comments(:one)
  end

  test "should get index" do
    get tv_show_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_tv_show_comment_url
    assert_response :success
  end

  test "should create tv_show_comment" do
    assert_difference('TvShowComment.count') do
      post tv_show_comments_url, params: { tv_show_comment: { content: @tv_show_comment.content, tv_show_id: @tv_show_comment.tv_show_id, user_id: @tv_show_comment.user_id } }
    end

    assert_redirected_to tv_show_comment_url(TvShowComment.last)
  end

  test "should show tv_show_comment" do
    get tv_show_comment_url(@tv_show_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_tv_show_comment_url(@tv_show_comment)
    assert_response :success
  end

  test "should update tv_show_comment" do
    patch tv_show_comment_url(@tv_show_comment), params: { tv_show_comment: { content: @tv_show_comment.content, tv_show_id: @tv_show_comment.tv_show_id, user_id: @tv_show_comment.user_id } }
    assert_redirected_to tv_show_comment_url(@tv_show_comment)
  end

  test "should destroy tv_show_comment" do
    assert_difference('TvShowComment.count', -1) do
      delete tv_show_comment_url(@tv_show_comment)
    end

    assert_redirected_to tv_show_comments_url
  end
end
