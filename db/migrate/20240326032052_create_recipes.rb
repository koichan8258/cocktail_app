class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :cocktail_name
      t.text :instruction

      t.timestamps
    end
  end
end
