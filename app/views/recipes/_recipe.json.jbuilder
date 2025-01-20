json.extract! recipe, :id, :title, :image, :image_type, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
