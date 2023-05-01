FactoryBot.define do
  factory :item do
    title              {'商品の名前'}
    about                 {'ははははああははっははは'}
    category_id         {'2'}
    condition_id         {'2'}
    shipment_fee_id         {'2'}
    prepare_id         {'2'}
    place_id         {'2'}
    price              {'300'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
