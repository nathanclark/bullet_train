class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :company, null: false, foreign_key: true
      t.string :employee_number
      t.string :employee_status
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region_state
      t.string :phone_number
      t.references :employee_department, null: false, foreign_key: true
      t.datetime :hire_date
      t.datetime :termination
      t.references :payroll_schedules, null: false, foreign_key: true
      t.references :payroll_federal_filing_status, null: false, foreign_key: true
      t.references :ledger_account, null: false, foreign_key: true
      t.references :payroll_federal_withholding_allowance, null: false, foreign_key: true
      t.float :payroll_federal_withholding_amount
      t.float :personal_time_balance
      t.float :vacation_time_balance
      t.float :sick_leave_balance
      t.datetime :compensation_increase_date
      t.datetime :next_compensation_increase_date
      t.string :marital_tax_status
      t.text :notes
      #t.references :eto_type, null: false, foreign_key: true
      t.string :email
      t.string :ssn
      t.string :zip_code
      t.string :tax_federal_exemptions
      t.string :tax_region_state
      t.string :tax_region_state_exemptions
      t.float :tax_other_income
      t.float :tax_deductions
      t.float :tax_extra_withholdings
      t.integer :tax_dependants

      t.timestamps
    end
  end
end
