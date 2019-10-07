class News < ApplicationRecord
  belongs_to :user, dependent: :destroy 
end
