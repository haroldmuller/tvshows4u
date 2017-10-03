json.extract! fav_episode, :id, :user_id, :episode_id, :favorite, :created_at, :updated_at
json.url fav_episode_url(fav_episode, format: :json)
