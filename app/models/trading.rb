class Trading < ApplicationRecord
  belongs_to :buyer_id, class_name: "User"
  belongs_to :seller_id, class_name: "User"
  has_many :tradings 
  has_many :reviews
  has_one  :trading
end
