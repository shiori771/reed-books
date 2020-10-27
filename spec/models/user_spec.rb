require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name, email, password, password_confirmation, profileが全て入力されれば保存されること' do
      expect(@user).to be_valid
    end

    it 'profileが空でも登録できること' do
      @user.profile = nil
      expect(@user).to be_valid
    end

    it 'nameが空だと登録できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@がないと登録できないこと' do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在すると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers', "Password confirmation doesn't match Password")
    end

    it 'passwordは半角英数の混合を入力しないと登録できないこと(数字のみ)' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end

    it 'passwordは半角英数の混合を入力しないと登録できないこと(半角アルファベットのみ)' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end

    it 'passwordは半角英数の混合を入力しないと登録できないこと(全角ひらがな、カタカナ、漢字)' do
      @user.password = 'テストてすと手'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password Include both letters and numbers')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a12345'
      @user.password_confirmation = 'b12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
