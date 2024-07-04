require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "バリデーションのテスト" do
    it "正しい属性値で有効であること" do
      item = FactoryBot.build(:item, category_id: 2, condition_id: 2)
      expect(item).to be_valid
    end

    it "商品名が必須であること" do
      item = FactoryBot.build(:item, product_name: nil)
      item.valid?
      expect(item.errors[:product_name]).to include("can't be blank")
    end

    it "商品の説明が必須であること" do
      item = FactoryBot.build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "カテゴリーの選択が必須であること" do
      item = FactoryBot.build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "商品の状態の選択が必須であること" do
      item = FactoryBot.build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "配送料の負担の選択が必須であること" do
      item = FactoryBot.build(:item, shipping_fee_burden_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_burden_id]).to include("can't be blank")
    end

    it "発送元の地域の選択が必須であること" do
      item = FactoryBot.build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数の選択が必須であること" do
      item = FactoryBot.build(:item, shipping_day_id: nil)
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it "価格が必須であること" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が300未満の場合に無効であること" do
      item = FactoryBot.build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
    end

    it "価格が9999999を超える場合に無効であること" do
      item = FactoryBot.build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
    end

    it "価格が半角数字でない場合に無効であること" do
      item = FactoryBot.build(:item, price: "abc")
      item.valid?
      expect(item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
    end

    it "商品画像が添付されていない場合に無効であること" do
      item = FactoryBot.build(:item)
      item.item_image.detach  # 添付された商品画像を削除する
    
      expect(item).not_to be_valid
      expect(item.errors[:item_image]).to include("can't be blank")
    end
  
  end
end