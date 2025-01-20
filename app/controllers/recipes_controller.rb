class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  rescue_from Mongoid::Errors::DocumentNotFound, with: :document_not_found

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all

  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  # GET /recipes/1/edit
  def edit
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_path, status: :see_other, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params.expect(:id))
    end

  def document_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.expect(recipe: [ :title, :image, :image_type])
    end
end
