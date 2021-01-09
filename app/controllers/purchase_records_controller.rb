class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if current_user == @item.user
       redirect_to root_path
      end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
    
  end


  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.purchase_record != nil
      redirect_to root_path
    end
  end

  
  private

    def purchase_record_params
      params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city,  :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end


    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
    end

end
