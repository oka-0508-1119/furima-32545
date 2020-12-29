require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
  before do
    @item = FactoryBot.build(:item)
  end
  
    context '商品出品がうまくいくとき' do
      it "image,name,product_description,category_id,product_condition_id,delivery_fee_id,shipping_area_id,days_to_ship_id,priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      
    end


    context '商品出品がうまくいかないとき' do
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "product_descriptionが空だと出品できない" do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it "categoryが未選択だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "product_conditionが未選択だと出品できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition must be other than 1"
      end
      it "delivery_feeが未選択だと出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it "shipping_areaが未選択だと出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area must be other than 1"
      end
      it "days_to_shipが未選択だと出品できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship must be other than 1"
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが設定範囲以外だと出品できない(10000000円)' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが設定範囲以外だと出品できない(299円)' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

    
    
    end


  end

end

