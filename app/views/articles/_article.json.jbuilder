json.extract! article, :id, :title, :desc, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
