class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")

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



  def item_params
    params.require(:item).permit(:title, :about, :prepare_id, :category_id, :condition_id, :image, :shipment_fee_id, :price, :place_id).merge(user_id: current_user.id)
  end
end
