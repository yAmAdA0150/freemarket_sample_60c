require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#create' do
    it "is valid with a user_id, customer_id, card_id" do
      expect(build(:card)).to be_valid
    end

    it "is invalid without a user" do
      card = build(:card, user: nil)
      card.valid?
      expect(card.errors[:user]).to include("must exist")
    end

    it "is invalid without a customer_id" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without a card_id" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end
