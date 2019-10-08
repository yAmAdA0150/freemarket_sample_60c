class Shipping < ApplicationRecord
  belongs_to :item
  has_one :trading
end
