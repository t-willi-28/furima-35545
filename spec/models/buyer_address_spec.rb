require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('app/assets/images/item-sample.png')
      @product.save
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, product_id: @product.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@buyer_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it '郵便番号が空だと保存できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形でないと購入できない' do
        @buyer_address.post_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid')
      end

      it '都道府県を選択しないと購入できない' do
        @buyer_address.from_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('From must be other than 1')
      end

      it '市区町村が空だと購入できない' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと購入できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が数値意外だと購入できない' do
        @buyer_address.phone_number = 'aaaaaaaaaaa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上だと購入できない' do
        @buyer_address.phone_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空だと購入できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいてないと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐づいてないと購入できない' do
        @buyer_address.product_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
