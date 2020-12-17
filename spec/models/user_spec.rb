require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user = FactoryBot.build(:user)
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it '重複したnicknameだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end
    it 'emailが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空だと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは６文字以上でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = '1q2w3'
      @user.password_confirmation = '1q2w3'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードは半角英数字混合でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'パスワードは確認用も入れて2回含めて入力しないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードとパスワード(確認用)が値が一致しないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = '1q2w3e'
      @user.password_confirmation = '0o9i8u'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'ユーザー本名は名字がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー本名は名前がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'ユーザー本名の名字は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'ユーザー本名の名前は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end
    it 'ユーザー本名のフリガナは名字がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'ユーザー本名のフリガナは名前がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'ユーザー本名のフリガナの名字は全角(カタカナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'ユーザー本名のフリガナの名前は全角(カタカナ)でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it '生年月日がないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
