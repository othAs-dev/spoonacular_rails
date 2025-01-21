class SpoonacularService
  include HTTParty
  base_uri "https://api.spoonacular.com"

  def initialize
    @api_key = ENV["API_KEY_SPOONACULAR"]
  end

  def get_recipes
    response = self.class.get("/recipes/complexSearch", query: { apiKey: @api_key })
    if response.success?
      response
    else
      raise "Failed to fetch recipes: #{response['message']}"
    end
  end

  def get_recipe_informations(id)
    response = self.class.get("/recipes/#{id}/information", query: { apiKey: @api_key })
    if response.success?
      response
    else
      raise "Failed to fetch recipe information: #{response['message']}"
    end
  end
end
