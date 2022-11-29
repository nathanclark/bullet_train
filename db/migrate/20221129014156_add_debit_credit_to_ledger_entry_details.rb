class AddDebitCreditToLedgerEntryDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :ledger_entry_details, :debit, :float
    add_column :ledger_entry_details, :credit, :float
  end
end
