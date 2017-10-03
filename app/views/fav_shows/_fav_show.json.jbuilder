json.extract! fav_show, :id, :user_id, :tv_show_id, :favorite, :created_at, :updated_at
json.url fav_show_url(fav_show, format: :json)
