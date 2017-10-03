json.extract! tv_show_comment, :id, :user_id, :tv_show_id, :content, :created_at, :updated_at
json.url tv_show_comment_url(tv_show_comment, format: :json)
