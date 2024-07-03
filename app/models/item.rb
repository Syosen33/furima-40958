class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 空の投稿を保存できないようにする
  validates :title, :text, presence: true

  # 商品名と説明のバリデーション
  validates :product_name, presence: true
  validates :description, presence: true

  # カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id, presence: true,numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true

  # 価格のバリデーション
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # 追加のバリデーション例:
  # validates :product_name, length: { maximum: 100 }
  # validates :description, length: { maximum: 1000 }
end