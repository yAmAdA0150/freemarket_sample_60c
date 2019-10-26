require 'rails_helper'
describe Address, type: :address do
  describe '#create' do
    it "is valid with a postcode, a city, a street, a prefecture_id" do
      address = build(:address)
      expect(build(:address)).to be_valid
    end

    it "is invalid without a postcode" do
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    it "is invalid without a street" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

  end
end