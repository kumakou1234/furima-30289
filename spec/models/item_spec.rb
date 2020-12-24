require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録' do
    context 'うまくいく場合' do
      it '画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すれば登録できる' do
        @item = FactoryBot.build(:item)
        @item.valid?
      end
      it '価格が300以上だと登録できる' do
        @item = FactoryBot.build(:item)
        @item.price = 300
        @item.valid?
      end
    end

    context 'うまくいかない場合' do
      it '画像が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品の説明が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.product_name_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name explanation can't be blank"
      end
      it 'カテゴリーの選択が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it '商品の状態の選択が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end
      it '配送料の選択が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping charges must be other than 1'
      end
      it '発送元の選択が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefectures must be other than 1'
      end
      it '発送までの日数の選択が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.says_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Says to ship must be other than 1'
      end
      it '価格が空だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が299以下だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が10,000,000以上だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it '価格が半角の英字だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が全角の数字だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が全角の文字だと登録できない' do
        @item = FactoryBot.build(:item)
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
