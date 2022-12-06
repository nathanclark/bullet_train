FactoryBot.define do
  factory :employee do
    association :company
    employee_number { "MyString" }
    employee_status { "MyString" }
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    region_state { "MyString" }
    phone_number { "MyString" }
    employee_department { nil }
    hire_date { "2022-12-06 16:04:48" }
    termination { "2022-12-06 16:04:48" }
    payroll_schedule { nil }
    payroll_federal_filing_status { nil }
    ledger_account { nil }
    payroll_federal_withholding_allowance { nil }
    payroll_federal_withholding_amount { 1.5 }
    personal_time_balance { 1.5 }
    vacation_time_balance { 1.5 }
    sick_leave_balance { 1.5 }
    compensation_increase_date { "2022-12-06 16:04:48" }
    next_compensation_increase_date { "2022-12-06 16:04:48" }
    marital_tax_status { "MyString" }
    notes { "MyText" }
    eto_type { nil }
    email { "MyString" }
    ssn { "MyString" }
    zip_code { "MyString" }
    tax_federal_exemptions { "MyString" }
    tax_region_state { "MyString" }
    tax_region_state_exemptions { "MyString" }
    tax_other_income { 1.5 }
    tax_deductions { 1.5 }
    tax_extra_withholdings { 1.5 }
    tax_dependants { 1 }
  end
end
