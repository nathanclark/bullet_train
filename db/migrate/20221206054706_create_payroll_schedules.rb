class CreatePayrollSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :payroll_schedules do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :occurrence

      t.timestamps
    end
  end
end
