require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、email、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
    end


    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "birth_dateが空では登録できないこと" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@が含まれていなければ登録できないこと' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it "first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.first_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it "last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it "first_name_kanaが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.first_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it "last_name_kanaが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.last_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it "passwordは、半角英数字混合での入力でなければ登録出来ないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    

    end
  end
end
