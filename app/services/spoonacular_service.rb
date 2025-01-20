class SpoonacularService
  include HTTParty
  base_uri "https://api.spoonacular.com"

  def initialize
    @api_key = ENV["API_KEY_SPOONACULAR"]
  end
  def get_recipes
    self.class.get("/recipes/complexSearch?query=&cuisine=Indian
", query: { apiKey: @api_key })
  end

  def get_recipe_information(id)
    self.class.get("/recipes/#{id}/information", query: { apiKey: @api_key })
  end
end
