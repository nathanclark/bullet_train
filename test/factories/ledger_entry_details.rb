FactoryBot.define do
  factory :ledger_entry_detail do
    association :ledger_entry
    ledger_account { nil }
    amount { 1.5 }
    note { "MyString" }
    order_number { 1 }
  end
end
