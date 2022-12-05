json.extract! vendor_invoice,
  :id,
  :vendor_id,
  :invoice_type,
  :invoice_total,
  :reference_number,
  :invoice_number,
  :invoice_date,
  :gl_posting_date,
  :discount_total,
  :discount_expiration_date,
  # 🚅 super scaffolding will insert new fields above this line.
  :created_at,
  :updated_at
