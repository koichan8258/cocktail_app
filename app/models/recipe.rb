class Recipe < ApplicationRecord
  validates :name, presence: true
  has_many :materials
  accepts_nested_attributes_for :materials
  end