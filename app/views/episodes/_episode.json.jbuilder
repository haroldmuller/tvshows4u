json.extract! episode, :id, :name, :season, :description, :duration, :release_year, :created_at, :updated_at
json.url episode_url(episode, format: :json)
