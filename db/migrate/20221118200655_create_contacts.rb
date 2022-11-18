class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :company, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :contact_type
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :fax_number
      t.string :cell_number
      t.string :work_number
      t.string :social_link
      t.string :cloudinary_image
      t.string :company_role

      t.timestamps
    end
  end
end
