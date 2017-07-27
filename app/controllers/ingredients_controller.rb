class IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.all
	end

	def new
		@ingredient = Ingredient.new
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.valid?
			@ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
			render :new
		end
	end

	def update
		@ingredient = Ingredient.find(params[:id])
		if @ingredient.update(ingredient_params)
			redirect_to ingredient_path(@ingredient)
		else
			render :edit
		end
	end

	# def destroy
	# 	@ingredient = Ingredient.find(params[:id])
	# 	@ingredient.destroy
	# 	redirect_to ingredient_path(@ingredient)
	# end

	private

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end
	
end
