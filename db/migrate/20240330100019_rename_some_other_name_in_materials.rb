class RenameSomeOtherNameInMaterials < ActiveRecord::Migration[7.0]
  def change
    # Rename column only if the 'some_other_name' column exists
    if column_exists?(:materials, :some_other_name)
      rename_column :materials, :some_other_name, :material_name
    end
  end
end