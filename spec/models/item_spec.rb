require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with a name, text, category_id, size_id, brand_id, display, " do
      item = build(:item)
      expect(item).to be_valid
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

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a size_id" do
      item = build(:item, size_id: nil)
      item.valid?
      expect(item.errors[:size_id]).to include("can't be blank")
    end

    it "is invalid without a brand_id" do
      item = build(:item, brand_id: nil)
      item.valid?
      expect(item.errors[:brand_id]).to include("can't be blank")
    end
  end
end