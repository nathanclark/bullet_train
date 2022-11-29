class AddDefaultsToLedgerEntryDetails < ActiveRecord::Migration[7.0]
  def change
    change_column_default :ledger_entry_details, :amount, 0.00
    change_column_default :ledger_entry_details, :debit, 0.00
    change_column_default :ledger_entry_details, :credit, 0.00

  end
end
