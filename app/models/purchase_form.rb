class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :phone_number, numericality: {only_integer: true}
    validates :item_id
    validates :user_id
    validates :token
  end
    validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}

def save
orders = Order.create(user_id: user_id,item_id: item_id)
StreetAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name,phone_number: phone_number,order_id: orders.id)
end
end