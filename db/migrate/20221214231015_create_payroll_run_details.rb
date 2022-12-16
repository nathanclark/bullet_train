class CreatePayrollRunDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_run_details do |t|
      t.references :payroll_run, null: false, foreign_key: true
      t.references :bank_account, null: false, foreign_key: true
      t.references :employee, null: true, foreign_key: true
      t.datetime :check_date
      t.datetime :pay_date
      t.float :amount

      t.timestamps
    end
  end
end
