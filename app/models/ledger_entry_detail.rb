class LedgerEntryDetail < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :ledger_entry
  belongs_to :ledger_account
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :ledger_entry
  has_one :company, through: :ledger_entry
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :order_number, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.
  def valid_parents
    #LedgerAccount.where("company_id= '#{company_id}'")
    LedgerAccount.all
  end
  # 🚅 add methods above.
end
