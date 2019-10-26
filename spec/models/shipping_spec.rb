require 'rails_helper'

describe Shipping do
  describe '#create' do
    it "is valid with a charge, delivery_method_id, term_id, display_id " do
      shipping = build(:shipping)
      expect(shipping).to be_valid
    end

    it "is invalid without a charge" do
      shipping = build(:shipping, charge: nil)
      shipping.valid?
      expect(shipping.errors[:charge]).to include("can't be blank")
    end

    it "is invalid without a delivery_method_id" do
      shipping = build(:shipping, delivery_method_id: nil)
      shipping.valid?
      expect(shipping.errors[:delivery_method_id]).to include("can't be blank")
    end

    it "is invalid without a term_id" do
      shipping = build(:shipping, term_id: nil)
      shipping.valid?
      expect(shipping.errors[:term_id]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      shipping = build(:shipping, prefecture_id: nil)
      shipping.valid?
      expect(shipping.errors[:prefecture_id]).to include("can't be blank")
    end
  end
end