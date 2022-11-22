FactoryBot.define do
  factory :ledger_entry do
    association :company
    post_date { "2022-11-20" }
    status { "MyString" }
    user { nil }
    note { "MyText" }
    source_type { "MyString" }
    fiscal_period { "MyString" }
  end
end
