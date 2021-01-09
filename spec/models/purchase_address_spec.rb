require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 0.1
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
   end

    context '商品購入がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
    expect(@purchase_address).to be_valid
    end

     it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
     end
    end

    context '商品購入がうまくいかないとき' do
    it "tokenが空では購入できない" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  
    it "postal_codeが空だと購入できない" do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
    end

    it "postal_codeにハイフンがないと購入できない" do
      @purchase_address.postal_code = 1234567
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
    end

  
    it "prefecture_idが未選択だと購入できない" do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 0"
    end
  
    it "house_numberが空だと購入できない" do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
    end
  
    it "phone_numberが空だと購入できない" do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
    end
  
    it "user_idが空だと登録できない" do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "User can't be blank"
    end
    
    it "item_idが空だと登録できない" do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
    end


    it "phone_numberが11桁以内でないと購入できない" do
      @purchase_address.phone_number = "123456789012"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end

    it "phone_numberが数字のみでないと購入できない" do
      @purchase_address.phone_number = "ABCあいう"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end
  
     end
  end
end