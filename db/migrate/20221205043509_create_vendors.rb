class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :vendor_number
      t.boolean :is_payee
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region
      t.string :zip_code
      t.string :phone_number
      t.references :ledger_account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
