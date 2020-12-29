class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :product_description, :category_id, :days_to_ship_id, :delivery_fee_id, :product_condition_id, :shipping_area_id).merge(user_id: current_user.id)
  end

end
