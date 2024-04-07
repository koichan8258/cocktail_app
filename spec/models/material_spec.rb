require 'rails_helper'

RSpec.describe Material, type: :model do
  before do
    user = FactoryBot.create(:user)
    recipe = FactoryBot.create(:recipe, user: user)
    material = FactoryBot.build(:material, recipe: recipe)
  end
    
  describe "FactoryBotのテスト" do
    it "有効なファクトリを持つこと" do
      expect(material).to be_valid
    end
  end

  describe "#required_material?" do
    it "関連するレシピが存在し、材料が2つ未満の場合にfalseを返すこと" do
      expect(material.required_material?).to be false
    end

    it "関連するレシピが存在し、材料が2つ以上の場合にtrueを返すこと" do
      recipe = FactoryBot.create(:recipe_with_materials)
      material = recipe.materials.first
      expect(material.required_material?).to eq true
    end

    it "関連するレシピが存在しない場合にfalseを返すこと" do
      material = FactoryBot.build(:material, recipe: nil)
      expect(material.required_material?).to eq false
    end
  end
end
