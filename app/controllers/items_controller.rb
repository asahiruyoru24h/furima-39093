class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show, :update]

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
    redirect_to root_path unless current_user == @item.user

  end




  def update
   if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  # def purchase
  #   @item= Item.find(params[:id])
  #   @item.update(customers_id: current_user.id)
  # end




  private
  def item_params
    params.require(:item).permit(:title, :about, :prepare_id, :category_id, :condition_id, :image, :shipment_fee_id, :price, :place_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end
