class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :instruction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
