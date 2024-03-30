class RenameSomeOtherNameInMaterials < ActiveRecord::Migration[7.0]
  def change
    rename_column :materials, :some_other_name, :material_name
  end
end