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
        expect(@user.errors.full_messages).to include("アカウント名を入力してください") 
      end

      it 'nicknameが9文字文字以上では登録できない' do
          @user.nickname = 'aaaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("アカウント名は8文字以内で入力してください")
      end

      it 'birth_dayが空白では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dayを入力してください")
      end

      it 'emailが空白では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@がなければ登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        
      end

      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        
      end

      it 'passwordが空白では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "000ab"
        @user.password_confirmation = "000ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    
    end

  end
end
