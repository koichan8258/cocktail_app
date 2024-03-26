class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    2.times { @recipe.materials.build } # 最初に表示する材料入力フォームの数
  end

  def create
    @recipe = Recipe.new(recipe_params)
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, materials_attributes: [:id, :name, :quantity, :_destroy])
  end
end