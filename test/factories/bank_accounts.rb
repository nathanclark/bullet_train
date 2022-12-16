FactoryBot.define do
  factory :bank_account do
    association :company
    name { "MyString" }
    account_number { "MyString" }
    routing_number { "MyString" }
    ledger_account { nil }
  end
end
