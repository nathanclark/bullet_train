class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.string :legal_name
      t.string :ein

      t.timestamps
    end
  end
end
