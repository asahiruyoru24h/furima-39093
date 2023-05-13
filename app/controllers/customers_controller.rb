class CustomersController < ApplicationController

  before_action :move_to_signed_in, only: [:index]

  before_action :set_item, only: [:create, :index]

  def index
    @address_customer = AddressCustomer.new
    
    if current_user == @item.user
       redirect_to root_path
      end
    if @item.customer.present? 
      redirect_to root_path
    end
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



def move_to_signed_in
  unless user_signed_in?
    redirect_to root_path 
  end

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





