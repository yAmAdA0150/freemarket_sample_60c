require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with a name, text, category_id, display_id " do
      expect(build(:item)).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a text" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("must exist")
    end

    it "is invalid without a user" do
      item = build(:item, user: nil)
      item.valid?
      expect(item.errors[:user]).to include("must exist")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a display_id" do
      item = build(:item, display_id: nil)
      item.valid?
      expect(item.errors[:display_id]).to include("can't be blank")
    end

    it "is invalid if price is less than 299" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than 299")
    end

    it "is invalid if price is less than 100000000" do
      item = build(:item, price: 100000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than 10000000")
    end
  end
end