class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number,:token

  validates :postal_code, :prefecture_id, :city, :street_address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }

  def save
    return false unless valid?

    order = Order.create(
      item_id: item_id,
      user_id: user_id
    )

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
