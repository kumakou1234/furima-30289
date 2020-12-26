class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
    
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_name_explanation, :category_id, :condition_id, :shipping_charges_id, :prefectures_id, :says_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
