class Material < ApplicationRecord
  belongs_to :recipe
  
  validates :material_name, presence: true, if: :required_material?
  validates :quantity, presence: true, if: :required_material?
  
  def required_material?
   recipe.materials.index(self) < 2
  end

  def self.ransackable_attributes(auth_object = nil)
    %w["created_at", "id", "material_name", "quantity", "recipe_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["recipe"]
  end

  end