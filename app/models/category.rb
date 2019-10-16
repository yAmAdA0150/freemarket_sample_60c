class Category < ApplicationRecord
  has_many :sizes,through: :size_charts
  has_many :items
  has_many :size_charts
  has_ancestry

end
