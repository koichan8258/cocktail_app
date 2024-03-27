class AddUserIdToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :user_id, :bigint
    add_index :recipes, :user_id
    add_foreign_key :recipes, :users
  end
end
