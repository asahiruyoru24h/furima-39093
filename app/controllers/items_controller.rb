class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_user, only: [:edit, :destroy]
  def index

    @items = Item.order(created_at: :desc)

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



  def edit
  end




  def update
   if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy

     if @item.destroy
      redirect_to root_path
     end
  end


  




  private
  def item_params
    params.require(:item).permit(:title, :about, :prepare_id, :category_id, :condition_id, :image, :shipment_fee_id, :price, :place_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_user
    redirect_to root_path if current_user != @item.user || @item.customer.present? 
  end

end

