class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

        has_many :comments, dependent: :destroy
        has_many :items, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :sns_credentials, dependent: :destroy
        has_many :notifications, dependent: :destroy
        has_many :to_do_lists, dependent: :destroy
        has_many :messages
        has_one  :address, dependent: :destroy
        has_one  :profile , dependent: :destroy
        has_one  :card, dependent: :destroy

        accepts_nested_attributes_for :address

        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
        validates :password, length: { minimum: 7, maximum: 128}
        validates :password_confirmation, length: { minimum: 7, maximum: 128}
        validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
        validates :name, :email, :password, :password_confirmation, :first_name, :first_name_kana ,:last_name, :last_name_kana, :mobile_number, :birthyear, :birthmonth, :birthday, presence: true

    @pass = Devise.friendly_token[0, 7]
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first
    snscredential = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if user.present? && snscredential.blank?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        email: auth.info.email,
        password: @pass,
        password_confirmation: @pass,
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    return { user: user ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        email: auth.info.email,
        password: @pass,
        password_confirmation: @pass,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end