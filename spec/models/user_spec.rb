require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, first_name, last_name, first_name_kana, last_name_kana, email, password, birthday, birthmonth, birthyear" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  # 　emailに正確ではない
    it "is invalid if email is already invalid" do
      user = build(:user, email:"abc")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    # name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a birthyear" do
      user = build(:user, birthyear: nil)
      user.valid?
      expect(user.errors[:birthyear]).to include("can't be blank")
    end

    it "is invalid without a birthmonth" do
      user = build(:user, birthmonth: nil)
      user.valid?
      expect(user.errors[:birthmonth]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # nameが19文字以下では登録できること
    it "is valid with a name that has less than 19 characters " do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    # 重複したemailが存在すること
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end