class CreatePayrollRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_runs do |t|
      t.references :company, null: false, foreign_key: true
      t.datetime :schedule
      t.string :employees_paid
      t.datetime :check_date
      t.datetime :pay_date

      t.timestamps
    end
  end
end
