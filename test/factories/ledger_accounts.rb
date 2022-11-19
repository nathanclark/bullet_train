FactoryBot.define do
  factory :ledger_account do
    title { "MyString" }
    association :company
    ledger_account_number { "MyString" }
    account_type { "MyString" }
    account_status { "MyString" }
    posting_type { "MyString" }
    alternate_account_number { "MyString" }
    visible { false }
    reporting_excluded { false }
    parent_id { 1 }
  end
end
