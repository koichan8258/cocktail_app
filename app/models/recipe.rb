class Recipe < ApplicationRecord
  validates :cocktail_name, presence: true
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials
  validates :materials, length: { minimum: 2, message: "は最低でも2つ必要です" }

  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["id", "cocktail_name", "instruction", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["materials"]
  end

  def self.search_material(material_name)
    joins(:materials).where(materials: { name: material_name })
  end
end
