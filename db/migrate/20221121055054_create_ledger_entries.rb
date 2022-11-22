class CreateLedgerEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :ledger_entries do |t|
      t.references :company, null: false, foreign_key: true
      t.date :post_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.text :note
      t.string :source_type
      t.string :fiscal_period

      t.timestamps
    end
  end
end
