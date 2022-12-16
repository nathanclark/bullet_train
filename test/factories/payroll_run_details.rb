FactoryBot.define do
  factory :payroll_run_detail do
    association :payroll_run
    bank_account { nil }
    employee { nil }
    check_date { "2022-12-14 17:10:15" }
    pay_date { "2022-12-14 17:10:15" }
    amount { 1.5 }
  end
end
