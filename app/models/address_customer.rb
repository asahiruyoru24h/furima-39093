class AddressCustomer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :place_id, :city, :building, :address_line, :mobile_number, :token


  


  validates :place_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :user_id
    validates :mobile_number, format: {with: /\A\d{10,11}\z/ }
    validates :address_line
    validates :token, presence: true
  end

  def save
    customer = Customer.create(item_id: item_id, user_id: user_id)
   
    Address.create(postcode: postcode, place_id: place_id, city: city, address_line: address_line, building: building, mobile_number: mobile_number, customer_id: customer_id)
 

  end
end



