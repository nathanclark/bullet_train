class CreatePostalAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :postal_addresses do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :address_type
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
