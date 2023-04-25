require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do

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
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '生年月日が空欄では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


    it'お名前(全角)の名字が空では登録できない'do
      @user.kanji_first_name = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
    end
    it'お名前(全角)の名前が空では登録できない'do
      @user.kanji_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
    end
    it'お名前カナ(全角)の名字が空では登録できない'do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it'お名前カナ(全角)の名前が空では登録できない'do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end


    it'お名前(全角)の名字は全角（漢字・ひらがな・カタカナ）以外では登録できない'do
      @user.kanji_first_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji first name 全角文字を使用してください")
    end
    it'お名前(全角)の名前は全角（漢字・ひらがな・カタカナ）以外では登録できない'do
      @user.kanji_last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji last name 全角文字を使用してください")
    end
    it'お名前カナ(全角)の名字は全角（漢字・ひらがな・カタカナ）以外では登録できない'do
      @user.kana_first_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name 全角カタカナカタカナを使用してください")
    end
    it'お名前カナ(全角)の名前は全角（漢字・ひらがな・カタカナ）以外では登録できない'do
      @user.kana_last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name 全角カタカナカタカナを使用してください")
    end


    

    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが全角では登録できない' do
      @user.password = '０４ｈｋｊｈ'
      @user.password_confirmation = '０４ｈｋｊｈ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end


   end




  end
end
