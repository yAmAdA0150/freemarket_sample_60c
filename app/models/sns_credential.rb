class SnsCredential < ApplicationRecord
  belongs_to :user, dependent: :destroy 
end
