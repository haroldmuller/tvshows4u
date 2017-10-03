json.extract! tv_show, :id, :name, :description, :country, :language, :created_at, :updated_at
json.url tv_show_url(tv_show, format: :json)
