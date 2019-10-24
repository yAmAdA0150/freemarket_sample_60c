class Address < ApplicationRecord
  
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :postcode,:city,:street,:prefecture_id, presence: true
end
