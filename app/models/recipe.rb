class Recipe < ApplicationRecord
  validates :cocktail_name, presence: true
  has_many :materials
  accepts_nested_attributes_for :materials
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