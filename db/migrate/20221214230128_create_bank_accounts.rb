class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :account_number
      t.string :routing_number
      t.references :ledger_account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
