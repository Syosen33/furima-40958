class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  accepts_nested_attributes_for :address
end
