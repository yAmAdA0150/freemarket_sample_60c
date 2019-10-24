class Shipping < ApplicationRecord
  belongs_to :item
  
  validates :term_id,:prefecture_id,:delivery_method_id,:charge, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :term
  belongs_to_active_hash :delivery_method
end
