class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user

  validates :name, :price, :product_description, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :days_to_ship_id, :delivery_fee_id, :product_condition_id, :shipping_area_id, numericality: { other_than: 1 }

end
