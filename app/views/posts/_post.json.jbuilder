json.extract! post, :id, :title, :short_description, :content, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
