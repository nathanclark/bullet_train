class AddSubAccountToLedgerAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :ledger_accounts, :sub, :string
    add_column :ledger_accounts, :acnt_type, :string
    add_column :ledger_accounts, :rb_cat, :string
    add_column :ledger_accounts, :product, :string
  end
end
