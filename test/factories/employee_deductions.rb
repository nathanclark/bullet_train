FactoryBot.define do
  factory :employee_deduction do
    company { nil }
    code { "MyString" }
    description { "MyString" }
    employee { nil }
    calculation_method { "MyString" }
    deduction_value { 1.5 }
    state_withholding { false }
    region_state { "MyString" }
    ytd_max { 1.5 }
  end
end
