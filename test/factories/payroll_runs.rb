FactoryBot.define do
  factory :payroll_run do
    association :company
    schedule { "2022-12-14 16:44:02" }
    employees_paid { "MyString" }
    check_date { "2022-12-14 16:44:02" }
    pay_date { "2022-12-14 16:44:02" }
  end
end
