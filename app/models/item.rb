class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :user
  belongs_to :size
  has_many :comments
  has_many :images
  has_many :likes
  has_one :trading
end
