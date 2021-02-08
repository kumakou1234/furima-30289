require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_form, user_id: @user, item_id: @item)
    sleep(1)
  end

  describe '商品購入' do
    context 'うまくいく場合' do
      it '郵便番号、都道府県、市町村、番地、建物名、電話番号、トークン、が存在すれば購入できる' do
        @purchase = FactoryBot.build(:purchase_form)
        @purchase.valid?
      end
      it '郵便番号、都道府県、市町村、番地、電話番号、トークン、が存在すれば購入できる' do
        @purchase = FactoryBot.build(:purchase_form)
        @purchase.building_name = ''
        @purchase.valid?
      end
    end
  end
  context 'うまくいかない場合' do
    it 'user idが空だと購入できない' do
      @purchase = FactoryBot.build(:purchase_form)
      @user  = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "User can't be blank"
    end
    it 'item idが空だと購入できない' do
      @purchase = FactoryBot.build(:purchase_form)
      @item  = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Item can't be blank"
    end
    it '郵便番号が空だとと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.postal_code = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号が〇〇〇-〇〇〇〇（-が無いと）と購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.postal_code = 1_234_567
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end
    it '都道府県の項目が空だと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.prefectures_id = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Prefectures can't be blank"
    end
    it '都道府県の項目が1だと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.prefectures_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Prefectures can't be blank"
    end
    it '市区町村が無いと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.municipalities = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include 'Municipalities is invalid'
    end
    it '番地が無いと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.address = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Address can't be blank"
    end
    it '電話番号が無いと購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include "Phone number can't be blank"
    end
    it '電話番号が全角英数では購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.phone_number = '１１１１１１'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include 'Phone number is not a number'
    end
    it '電話番号に-を入力すると購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.phone_number = '000-2222'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include 'Phone number is not a number'
    end
     it '電話番号が12文字では購入できない ' do
      @purchase = FactoryBot.build(:purchase_form)
      @purchase.phone_number = 111111111111
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include 'Phone number is too long (maximum is 11 characters)'
    end
  end
end
