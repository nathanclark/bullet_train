FactoryBot.define do
  factory :contact do
    association :company
    team { nil }
    contact_type { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    title { "MyString" }
    email { "MyString" }
    fax_number { "MyString" }
    cell_number { "MyString" }
    work_number { "MyString" }
    social_link { "MyString" }
    cloudinary_image { "MyString" }
    company_role { "MyString" }
  end
end
