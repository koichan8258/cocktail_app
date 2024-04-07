require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe "レシピ投稿" do
    it "カクテル名がある場合は有効であること" do
      @recipe = FactoryBot.build(:recipe, cocktail_name: "テストカクテル")
      expect(@recipe).to be_valid
    end

    it "カクテル名がない場合は無効であること" do
      @recipe.cocktail_name = nil # カクテル名をnilに設定
      @recipe.valid?
      expect(@recipe.errors[:cocktail_name]).to include("を入力してください")
    end

    it "材料が2つ以上ある場合は有効であること" do
      recipe = FactoryBot.build(:recipe_with_materials, materials_count: 2)
      expect(recipe).to be_valid
    end

    it "材料が2つ未満の場合は無効であること" do
      recipe = FactoryBot.build(:recipe)
      recipe.materials = [] # 0つの材料を設定することで2つ未満にする
      recipe.valid?
      expect(recipe.errors[:materials]).to include("は最低でも2つ必要です")
    end
  end

  describe "関連付け" do
    it "ユーザーに属していること" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "複数の材料を持つこと" do
      association = described_class.reflect_on_association(:materials)
      expect(association.macro).to eq :has_many
    end

    it "レシピが削除されると関連する材料も削除されること" do
      recipe = FactoryBot.create(:recipe_with_materials)
      expect { recipe.destroy }.to change { Material.count }.by(-recipe.materials.count)
    end
  end

  describe "検索メソッド" do
    it "特定の材料名でレシピを検索する" do
      material_name = "テスト材料"
      recipe = FactoryBot.create(:recipe_with_materials, materials_count: 3)
      recipe.materials.last.update(material_name: material_name)
      expect(Recipe.search_material(material_name)).to include(recipe)
    end
  end
end
