class Size < ApplicationRecord
  has_many :items
  has_many :size_charts
  has_many :categories,through: :size_charts
end
