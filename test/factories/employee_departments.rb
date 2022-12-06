FactoryBot.define do
  factory :employee_department do
    name { "MyString" }
    association :company
  end
end
