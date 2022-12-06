class CreatePayrollFederalFilingStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_federal_filing_statuses do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
