class CreateLedgerAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :ledger_accounts do |t|
      t.string :title
      t.references :company, null: false, foreign_key: true
      t.string :ledger_account_number
      t.string :account_type
      t.string :account_status
      t.string :posting_type
      t.string :alternate_account_number
      t.boolean :visible
      t.boolean :reporting_excluded
      t.integer :parent_id, foreign_key: {to_table: 'ledger_accounts'}, null: true

      t.timestamps
    end
  end
end
