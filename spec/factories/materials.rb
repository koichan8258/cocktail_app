FactoryBot.define do
  factory :material do
  material_name { "Ingredient" }
  quantity { "100 ml" }
  association :recipe
  end
end
