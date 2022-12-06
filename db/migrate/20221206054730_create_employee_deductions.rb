class CreateEmployeeDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_deductions do |t|
      t.references :company, null: false, foreign_key: true
      t.string :code
      t.string :description
      t.references :employee, null: false, foreign_key: true
      t.string :calculation_method
      t.float :deduction_value
      t.boolean :state_withholding
      t.string :region_state
      t.float :ytd_max

      t.timestamps
    end
  end
end
