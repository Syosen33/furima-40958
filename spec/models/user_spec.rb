require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      before do
        @user.password = 'password1'
        @user.password_confirmation = @user.password
        @user.save
      end
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = 'different'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = 'a' * 129
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
    end

    it 'passwordは半角英数字混合でなければ登録できない' do
      @user.password = 'password'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
    end

    it 'passwordが数字のみでは登録できない' do
      @user.password = '12345678'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
    end

    it 'passwordが全角文字では登録できない' do
      @user.password = 'ｐａｓｓｗｏｒｄ１２３'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力してください')
    end

    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力してください')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
