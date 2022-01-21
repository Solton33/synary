require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,birthday,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空白では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end

      it 'nicknameが9文字文字以上では登録できない' do
          @user.nickname = 'aaaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 8 characters)")
      end

      it 'birth_dayが空白では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'emailが空白では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がなければ登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        
      end

      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        
      end

      it 'passwordが空白では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = "aaaaaa"
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "000ab"
        @user.password_confirmation = "000ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
    end

  end
end
