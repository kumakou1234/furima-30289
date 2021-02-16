class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_name_explanation
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :says_to_ship_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :says_to_ship
end
