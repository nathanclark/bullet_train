FactoryBot.define do
  factory :postal_address do
    association :company
    address_type { "MyString" }
    street1 { "MyString" }
    street2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zipcode { "MyString" }
  end
end
