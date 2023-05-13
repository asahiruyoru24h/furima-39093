class CustomersController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  before_action :set_item, only: [:create, :index]
  before_action :move_user, only: [:index]

  def index
    @address_customer = AddressCustomer.new
    
   
  end

def create
  @address_customer = AddressCustomer.new(customer_params)
  if @address_customer.valid?

     pay_item
    
    @address_customer.save
    redirect_to root_path 
  else
    render :index
  end

  
end

private

def set_item
  @item = Item.find(params[:item_id])

end




def customer_params
  params.require(:address_customer).permit(:postcode, :place_id, :city, :address_line, :building, :mobile_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])

end



def move_user
  redirect_to root_path if current_user == @item.user || @item.customer.present? 
end




def  pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
        amount: @item.price, 
        card: params[:token] ,
        currency: 'jpy'
      )
end

end





