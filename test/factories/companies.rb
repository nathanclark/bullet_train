FactoryBot.define do
  factory :company do
    association :team
    name { "MyString" }
    legal_name { "MyString" }
    ein { "MyString" }
  end
end
