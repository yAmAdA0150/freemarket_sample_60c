class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :user
  belongs_to :size
  has_many :comments
  has_many :images
  has_many :likes
  has_one :trading
  has_one :shipping

  validates :images, associated: true, presence: true

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :shipping

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :display

  validates :name, :price, :text, :user_id, :condition_id, :category_id, presence: true
end
