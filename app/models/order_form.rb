class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be a number between 10 and 11 digits' }
  validates :token, presence: true
  validates :item_id
  validates :user_id
  end
  def save
    return false unless valid?

    order = Order.create(
      item_id:,
      user_id:
    )

    Address.create(
      postal_code:,
      prefecture_id:,
      city:,
      street_address:,
      building:,
      phone_number:,
      order_id: order.id
    )
  end
end
