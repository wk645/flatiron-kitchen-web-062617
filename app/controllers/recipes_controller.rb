class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		# @ingredients = @recipe.ingredients
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	end

	def create
		@recipe = Recipe.create(recipe_params)
		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	# def destroy
	# 	@recipe = Recipe.find(params[:id])
	# 	@recipe.destroy
	# 	redirect_to recipe_path(@recipe)
	# end

	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids: [])
	end


end
