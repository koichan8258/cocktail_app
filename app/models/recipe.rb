class Recipe < ApplicationRecord
  validates :cocktail_name, presence: true
  has_many :materials
  accepts_nested_attributes_for :materials
  belongs_to :user
  end