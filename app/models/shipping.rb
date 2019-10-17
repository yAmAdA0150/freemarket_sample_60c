class Shipping < ApplicationRecord
  belongs_to :item
  has_one :trading

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :term
  belongs_to_active_hash :delivery_method
end
