class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.new
   
  end

  def create
    # Item.create(item_params)

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
     else
       render :new
     end
  end


   private

  def item_params
     params.require(:item).permit(:image, :product_name, :product_name_explanation, :category_id, :condition_id, :shipping_charges_id, :prefectures_id, :says_to_ship_id, :price).merge(user_id: current_user.id)

   end

end
