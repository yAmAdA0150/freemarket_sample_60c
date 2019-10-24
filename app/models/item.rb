class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  has_many :comments
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :trading
  has_one :shipping, dependent: :destroy

  validates :images, length: {maximum: 10, minimum: 1}

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :shipping

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :display

  validates :name, :price, :text, :user_id, :condition_id, :category_id, :display_id ,presence: true
  validates :price, 
            presence: true,
            numericality: { only_integer: true,  greater_than: 299, less_than: 10000000}
end
