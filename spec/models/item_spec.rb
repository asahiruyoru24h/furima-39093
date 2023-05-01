require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
     @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do
  context '出品できるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '出品できないとき' do
    it '商品名が空では登録できない' do
     @item.title = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Title can't be blank")
    end
  it '商品の説明が空では登録できない' do
     @item.about = ''
     @item.valid?
    expect(@item.errors.full_messages).to include("About can't be blank")
  end
  it 'カテゴリーの情報が初期値では登録できない' do
     @item.category_id = '1'
     @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it '商品の状態の情報が初期値では登録できない' do
     @item.condition_id = '1'
     @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it '配送料の負担の情報が初期値では登録できない' do
    @item.shipment_fee_id = '1'
     @item.valid?
    expect(@item.errors.full_messages).to include("Shipment fee can't be blank")
  end
  it '発送元の地域の情報が初期値では登録できない' do
     @item.place_id = '1'
     @item.valid?
    expect(@item.errors.full_messages).to include("Place can't be blank")
  end
  it '発送までの日数の情報が初期値では登録できない' do
     @item.prepare_id = '1'
     @item.valid?
    expect(@item.errors.full_messages).to include("Prepare can't be blank")
  end
  it '価格の情報が300~9,999,999では登録できない' do
     @item.price = '299'
     @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
  it '価格の情報が300~9,999,999では登録できない' do
    @item.price = '10000000'
    @item.valid?
   expect(@item.errors.full_messages).to include("Price Out of setting range")
 end
  it '商品画像が空では登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'userが紐付いていないと保存できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end

end
end
end
