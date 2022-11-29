json.ledger_entry do
  json.extract! ledger_entry,
                :id,
                :company_id,
                :post_date,
                :status,
                :source_type,
                :fiscal_period,
                # 🚅 super scaffolding will insert new fields above this line.
                :created_at,
                :updated_at

  json.company do
    json.extract! ledger_entry.company,
                  :id
  end
end

