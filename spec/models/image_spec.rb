require 'rails_helper'

describe Image do
  describe '#create' do
    it "is valid with a url, a user" do
      image = build(:image)
      expect(image).to be_valid
    end

    it "is invalid without a item" do
      image = build(:image, item: nil)
      image.valid?
      expect(image.errors[:item]).to include("must exist")
    end

    it "is invalid without a name" do
      image = build(:image, url: nil)
      image.valid?
      expect(image.errors[:url]).to include("can't be blank")
    end
  end
end