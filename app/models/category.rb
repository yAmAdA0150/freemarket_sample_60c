class Category < ApplicationRecord
  has_many :size_charts
  has_many :sizes,through: :size_charts
  has_many :items
  has_ancestry

end
