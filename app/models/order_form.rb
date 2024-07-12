class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力してください' }
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
