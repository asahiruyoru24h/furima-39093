class CustomersController < ApplicationController


  def index
    @item = Item.find(params[:item_id])
    @address_customer = AddressCustomer.new
  end

def create
  @item = Item.find(params[:item_id])
  @address_customer = AddressCustomer.new(customer_params)
  if @address_customer.valid?
    @address_customer.save
    redirect_to root_path 
  else
    render :index
  end
end

private

def customer_params
  params.require(:address_customer).permit(:postcode, :place_id, :city, :address_line, :building, :mobile_number).merge(user_id: current_user.id, item_id: @item.id)

end

end





