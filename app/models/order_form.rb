class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number

  # バリデーションの設定
  validates :postal_code, :prefecture_id, :city, :street_address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }

  def save
    order = Order.create
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
