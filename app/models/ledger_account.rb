class LedgerAccount < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  belongs_to :parent, foreign_key: :parent_id , class_name: "LedgerAccount", optional: true

  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :company
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :title, presence: true
  validates :parent, scope: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_parents
    company.ledger_accounts
  end

  # 🚅 add methods above.
end
