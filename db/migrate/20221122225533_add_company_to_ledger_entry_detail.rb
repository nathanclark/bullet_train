class AddCompanyToLedgerEntryDetail < ActiveRecord::Migration[7.0]
  def change
    add_reference :ledger_entry_details, :company, null: true, foreign_key: true
  end
end
