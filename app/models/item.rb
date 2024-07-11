class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :item_image
  belongs_to :user

  # 商品名のバリデーション
  validates :product_name, presence: true, length: { maximum: 100 }

  # 説明のバリデーション
  validates :description, presence: true, length: { maximum: 1000 }

  # カテゴリーのバリデーション
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  # 商品の状態のバリデーション
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  # 送料の負担のバリデーション
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  # 配送元の地域のバリデーション
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  # 発送までの日数のバリデーション
  validates :shipping_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  # 価格のバリデーション
  validates :price, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9999999,
                      message: "は¥300から¥9,999,999の間で設定してください"
                    }

   validates :item_image, presence: true

   def sold_out?
    order.present?
  end
end