require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品を出品' do
    context '出品できる時' do
      it '情報を正しく入力すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '出品できない時' do
      it '画像が添付されていないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がないと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーを選択しないと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態を選択しないと出品できない' do
        @product.stat_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Stat must be other than 1')
      end

      it '発送元を選択しないと出品できない' do
        @product.from_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('From must be other than 1')
      end

      it '発送までの日数を選択しないと出品できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it '配送料の負担を選択しないと出品できない' do
        @product.cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Cost must be other than 1')
      end

      it '商品の価格がないと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '商品の価格が半角数字でないと出品できない' do
        @product.price = 'aaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '商品の価格が300円未満だと出品できない' do
        @product.price = 10
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '商品の価格が10000000円以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
