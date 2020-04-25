json.extract! post, :id, :admin_id, :title, :body, :post_image_id, :created_at, :updated_at
json.url post_url(post, format: :json)
