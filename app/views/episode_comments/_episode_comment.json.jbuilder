json.extract! episode_comment, :id, :user_id, :episode_id, :content, :created_at, :updated_at
json.url episode_comment_url(episode_comment, format: :json)
