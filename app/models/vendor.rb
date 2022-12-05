class Vendor < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  belongs_to :ledger_account, optional: true
  # 🚅 add belongs_to associations above.

  has_many :vendor_invoices, dependent: :destroy,enable_updates: true, inverse_of: :vendor
  # 🚅 add has_many associations above.

  has_one :team, through: :company
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :name, presence: true
  validates :ledger_account, scope: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_ledger_accounts
    company.ledger_accounts
  end

  # 🚅 add methods above.
end
