FactoryBot.define do
  factory :recipe do
    cocktail_name { "テストカクテル" }
    instruction { "Mix all ingredients together." }
    user

    transient do
      materials_count { 2 }  # デフォルトは2つの材料
    end

    after(:create) do |recipe, evaluator|
      create_list(:material, evaluator.materials_count, recipe: recipe)
    end
  end
end
