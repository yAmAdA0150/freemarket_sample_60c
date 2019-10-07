class CreditCard < ApplicationRecord
  belongs_to :user, dependent: :destroy 
end
