class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :product_name_explanation, presence: true
  validates :category_id,                 numericality: { other_than: 1 }
  validates :condition_id,                numericality: { other_than: 1 }
  validates :shipping_charges_id,         numericality: { other_than: 1 }
  validates :prefectures_id,              numericality: { other_than: 1 }
  validates :says_to_ship_id,             numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
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
