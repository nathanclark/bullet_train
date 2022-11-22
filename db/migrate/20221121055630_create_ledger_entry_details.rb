class CreateLedgerEntryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :ledger_entry_details do |t|
      t.references :ledger_entry, null: false, foreign_key: true
      t.references :ledger_account, null: false, foreign_key: true
      t.float :amount
      t.string :note
      t.integer :order_number

      t.timestamps
    end
  end
end
