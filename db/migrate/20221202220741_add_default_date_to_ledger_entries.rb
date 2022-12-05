class AddDefaultDateToLedgerEntries < ActiveRecord::Migration[7.0]
  def change
    #Change ledger entries to have a default date of today
    change_column_default :ledger_entries, :post_date, -> { 'CURRENT_DATE' }
  end
end
