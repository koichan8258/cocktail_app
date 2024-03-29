class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_latest_recipes, only: [:new, :index]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.materials.build } 
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    @latest_recipes = Recipe.order(created_at: :desc).limit(5)
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:cocktail_name, :instruction, materials_attributes: [:material_name, :quantity])
  end

  def set_latest_recipes
    @latest_recipes = Recipe.order(created_at: :desc).limit(3)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end