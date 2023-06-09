class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode         , null: false 
      t.integer :place_id    , null: false
      t.string :city              , null: false
      t.string :address_line          , null: false
      t.string :building     
      t.string :mobile_number               , null: false
      t.references :customer      , null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
