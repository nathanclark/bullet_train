FactoryBot.define do
  factory :vendor do
    association :company
    name { "MyString" }
    vendor_number { "MyString" }
    is_payee { false }
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    region { "MyString" }
    zip_code { "MyString" }
    phone_number { "MyString" }
    ledger_account { nil }
  end
end
