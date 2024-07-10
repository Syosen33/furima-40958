class Order < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :user
  belongs_to :item

  accepts_nested_attributes_for :address

  validates :price, presence: true
end
