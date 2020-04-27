json.extract! menu, :id,:menu_category_id, :menu_name, :explanation, :price,:takeout, :sales_status, :created_at, :updated_at
json.url menu_url(menu, format: :json)
