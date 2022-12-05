class CreateVendorInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :vendor_invoices do |t|
      t.references :company, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :invoice_type
      t.float :invoice_total
      t.string :reference_number
      t.string :invoice_number
      t.date :invoice_date
      t.date :gl_posting_date
      t.float :discount_total
      t.date :discount_expiration_date

      t.timestamps
    end
  end
end
