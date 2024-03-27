class RenameCocktailNameInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :name, :cocktail_name
  end
end
