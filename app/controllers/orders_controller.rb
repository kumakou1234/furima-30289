class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm .new
    
  end
  
  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params) 
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.permit(:postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end

end
  