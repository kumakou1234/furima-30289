class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
    redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item

      @purchase_form.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
