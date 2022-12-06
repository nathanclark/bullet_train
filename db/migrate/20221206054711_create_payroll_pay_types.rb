class CreatePayrollPayTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_pay_types do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
