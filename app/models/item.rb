class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :place
  belongs_to :prepare
  belongs_to :shipment_fee



  validates :title, :about, :image, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipment_fee_id, numericality: { other_than: 1 }
  validates :prepare_id, numericality: { other_than: 1 }
  validates :place_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }



  belongs_to :user
  has_one :customer



end
