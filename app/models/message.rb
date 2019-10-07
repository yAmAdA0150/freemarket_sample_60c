class Message < ApplicationRecord
  belongs_to :trading, dependent: :destroy 
  belongs_to :user
end
