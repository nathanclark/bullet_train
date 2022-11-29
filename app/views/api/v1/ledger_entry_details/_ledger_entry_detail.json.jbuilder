json.ledger_entry_detail do
  json.extract! ledger_entry_detail,
                :id,
                :ledger_entry_id,
                :order_number,
                :amount,
                :debit,
                :credit,
                :note,
                :ledger_account,
                # 🚅 super scaffolding will insert new fields above this line.
                :created_at,
                :updated_at
  if json.ledger_account
    json.ledger_account do
      json.extract! ledger_entry_detail.ledger_account,
                    :id

    end
  end
end