class Material < ApplicationRecord
  belongs_to :recipe
  
  validates :material_name, presence: true, if: :required_material?
  validates :quantity, presence: true, if: :required_material?
  
  def required_material?
   recipe.materials.index(self) < 2
  end
  end