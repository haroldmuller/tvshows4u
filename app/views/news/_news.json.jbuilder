json.extract! news, :id, :user_id, :tv_show_id, :content, :created_at, :updated_at
json.url news_url(news, format: :json)
