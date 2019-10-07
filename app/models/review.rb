class Review < ApplicationRecord
  belongs_to :trader
  belongs_to :user
end
