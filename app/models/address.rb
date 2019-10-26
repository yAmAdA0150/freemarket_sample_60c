class Address < ApplicationRecord
  
  belongs_to :user
  
  validates :postcode,:city,:street, :prefecture_id, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
