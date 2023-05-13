require 'rails_helper'

RSpec.describe AddressCustomer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)

    @address_customer = FactoryBot.build(:address_customer, user_id: @user.id, item_id: @item.id)
 end

 describe '商品購入機能' do
  context '購入できる時' do
    it '建物名が空でも登録できる' do
      @address_customer.building = ''
      expect(@address_customer).to be_valid
    end
    it '全ての項目が存在すれば登録できる' do
      expect(@address_customer).to be_valid
    end
   

  end

context '購入できない時' do
  it '郵便番号が空では登録できない' do
    @address_customer.postcode = ''
    @address_customer.valid?
    expect(@address_customer.errors.full_messages).to include("Postcode can't be blank")
   end
   it '郵便番号がハイフンなしでは登録できない' do
    @address_customer.postcode = '6820857'
    @address_customer.valid?
    expect(@address_customer.errors.full_messages).to include("Postcode is invalid")
   end

 it '都道府県の情報が初期値では登録できない' do
    @address_customer.place_id = '1'
    @address_customer.valid?
   expect(@address_customer.errors.full_messages).to include("Place must be other than 1")
 end
 it '市区町村が空では登録できない' do
  @address_customer.city = ''
  @address_customer.valid?
  expect(@address_customer.errors.full_messages).to include("City can't be blank")
 end
it '番地が空では登録できない' do
  @address_customer.address_line = ''
  @address_customer.valid?
 expect(@address_customer.errors.full_messages).to include("Address line can't be blank")
end
it '電話番号が空では登録できない' do
  @address_customer.mobile_number = ''
  @address_customer.valid?
  expect(@address_customer.errors.full_messages).to include("Mobile number can't be blank")
 end

 it '電話番号に半角数字以外が含まれている場合は登録できない' do
  @address_customer.mobile_number = '０９０１２３４５６７８'
  @address_customer.valid?
 expect(@address_customer.errors.full_messages).to include("Mobile number is invalid")
end

it '電話番号が９桁では登録できない' do
  @address_customer.mobile_number = '123456789'
  @address_customer.valid?
  expect(@address_customer.errors.full_messages).to include("Mobile number is invalid")
 end

 it '電話番号が12桁では登録できない' do
  @address_customer.mobile_number = '123456789012'
  @address_customer.valid?
 expect(@address_customer.errors.full_messages).to include("Mobile number is invalid")
end

 it 'userが紐付いていないと保存できない' do
  @address_customer.user_id = nil
  @address_customer.valid?
  expect(@address_customer.errors.full_messages).to include("User can't be blank")
end

 

  it "tokenが空では登録できないこと" do
    @address_customer.token = nil
    @address_customer.valid?
    expect(@address_customer.errors.full_messages).to include("Token can't be blank")
  end


end
end
end