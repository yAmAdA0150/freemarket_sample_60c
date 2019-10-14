class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

        has_many :comments, dependent: :destroy
        has_many :items, dependent: :destroy
        has_many :likes
        has_many :sns_credentials
        has_many :traders
        has_many :notifications, dependent: :destroy
        has_many :to_do_lists, dependent: :destroy
        has_many :messages
        has_one  :address, dependent: :destroy
        has_one :profile , dependent: :destroy
        has_one :card, dependent: :destroy

        accepts_nested_attributes_for :address


        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
        validates :password, length: { minimum: 7, maximum: 128}
        validates :password_confirmation, length: { minimum: 7, maximum: 128}
        validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
        validates :name, :email, :password, :password_confirmation, :first_name, :first_name_kana ,:last_name, :last_name_kana, :mobile_number, presence: true

        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.uid = auth.uid
            user.provider = auth.provider
            user.name = auth.info.name
            user.email = auth.info.email
            user.first_name = auth.info.first_name
            user.last_name = auth.info.last_name
            user.password = Devise.friendly_token[0, 20]
          end

      end
    end