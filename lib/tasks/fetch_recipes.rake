namespace :fetch_recipes do

  desc "Fetch random recipes and their details from Spoonacular API and save them to the database"

  task store: :environment do
    service = SpoonacularService.new
    response = service.get_recipes

    if response.success?
      response["results"].each do |result|

        recipe = Recipe.find_or_create_by(spoonacular_id: result["id"])
        recipe.update!(
          title: result["title"],
          image: result["image"],
          image_type: result["imageType"]
        )

        details_response = service.get_recipe_information(result["id"])
        if details_response.success?

          details_response["extendedIngredients"].each do |ingredient_data|
            recipe.ingredients.find_or_create_by(
              name: ingredient_data["name"],
              amount: ingredient_data["amount"],
              unit: ingredient_data["unit"]
            )
          end
        else
          puts "Failed to fetch details for recipe ID #{result['id']}: #{details_response['message']}"
        end
      end
      puts "Recipes and details saved to the database!"
    else
      puts "Failed to fetch recipes: #{response['message']}"
    end
  end
end
