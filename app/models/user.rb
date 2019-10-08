class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :comments
        has_many :items
        has_many :likes
        has_many :sns_credentials
        has_many :traders
        has_many :news
        has_many :notifications
        has_many :to_do_lists
        has_many :messages
        has_one  :address
        has_one :credit_card
        has_one :profile 
end
