class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :product_name_explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :prefectures_id, presence: true
  validates :says_to_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :says_to_ship
end
