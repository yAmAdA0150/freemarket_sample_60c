class Review < ApplicationRecord
  belongs_to :trading
  belongs_to :user
end
