require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品" do
    before do
      @item = FactoryBot.build(:item)
    end


    context '商品が出品できる時' do

    it "商品が出品できる場合" do
      expect(@item).to be_valid
    end

    context '商品が出品できない時' do
      it "商品名が必須であること" do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors[:product_name]).to include("can't be blank")
      end

      it "商品の説明が必須であること" do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it "カテゴリーの選択が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it "商品の状態の選択が必須であること" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it "配送料の負担の選択が必須であること" do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors[:shipping_fee_burden_id]).to include("can't be blank")
      end

      it "発送元の地域の選択が必須であること" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it "発送までの日数の選択が必須であること" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors[:shipping_day_id]).to include("can't be blank")
      end

      it "価格が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it "価格が300未満の場合に無効であること" do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
      end

      it "価格が9999999を超える場合に無効であること" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
      end

      it "価格が半角数字でない場合に無効であること" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors[:price]).to include("は¥300から¥9,999,999の間で設定してください")
      end

      it "商品画像が添付されていない場合に無効であること" do
        @item.item_image.detach  # 添付された商品画像を削除する
    
        expect(@item).not_to be_valid
        expect(@item.errors[:item_image]).to include("can't be blank")
      end

      it "カテゴリーに「---」が選択されている場合は出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("を選択してください")
      end

      it "商品の状態に「---」が選択されている場合は出品できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include("を選択してください")
      end

      it "配送料の負担に「---」が選択されている場合は出品できない" do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors[:shipping_fee_burden_id]).to include("を選択してください")
      end

      it "発送元の地域に「---」が選択されている場合は出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("を選択してください")
      end

      it "発送までの日数に「---」が選択されている場合は出品できない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors[:shipping_day_id]).to include("を選択してください")
      end
    end

    it "出品者が紐付いていなければ出品できないこと" do
      @item.user = nil  # ユーザーをnilに設定
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
     end
    end
  end
end
