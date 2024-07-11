class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁-4桁」の形式で入力してください" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }

   validates :token, presence: true
  

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
