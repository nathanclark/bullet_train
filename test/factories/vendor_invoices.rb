FactoryBot.define do
  factory :vendor_invoice do
    company { nil }
    association :vendor
    invoice_type { "MyString" }
    invoice_total { 1.5 }
    reference_number { "MyString" }
    invoice_number { "MyString" }
    invoice_date { "2022-12-04" }
    gl_posting_date { "2022-12-04" }
    discount_total { 1.5 }
    discount_expiration_date { "2022-12-04" }
  end
end
