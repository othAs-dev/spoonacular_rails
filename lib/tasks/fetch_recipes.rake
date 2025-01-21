namespace :fetch_recipes do
  desc "Fetch recipes and their ingredients from Spoonacular API and save them to the database"

  task store: :environment do
    service = SpoonacularService.new
    recipes = service.get_recipes
    # Check if the response is successful and iterate over the results to save the recipes to the database
    if recipes.success?
      recipes["results"].each do |result|
        recipe = Recipe.find_or_create_by(
          spoonacular_id: result["id"],
          title: result["title"],
          image: result["image"],
          image_type: result["imageType"]
        )
        # Fetch the recipe details to get the ingredients
        recipe_informations = service.get_recipe_informations(result["id"])
        # Check if the response is successful and iterate over the ingredients to save them to the database
        if recipe_informations.success?
          recipe_informations["extendedIngredients"].each do |ingredient_data|
            recipe.ingredients.find_or_create_by(
              name: ingredient_data["name"],
              amount: ingredient_data["amount"],
              unit: ingredient_data["unit"]
            )
          end
        else
          puts "Failed to fetch ingredients for recipe ID #{result["id"]}: #{details_response['message']}"
        end
      end
      puts "Recipes and ingredients saved to the database!"
    else
      puts "Failed to fetch recipes: #{response["message"]}"
    end
  end
end
