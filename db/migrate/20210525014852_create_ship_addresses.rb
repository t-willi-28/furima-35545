class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string     :post_code,    null: false
      t.integer    :from_id,      null: false
      t.string     :municipality, null: false
      t.string     :building_name
      t.string     :address,      null: false
      t.string     :phone_number, null: false
      t.references :buyer,        foreign_key: true
      t.timestamps
    end
  end
end
