class BankAccount < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  belongs_to :ledger_account, optional: true
  # 🚅 add belongs_to associations above.

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
    # please specify what objects should be considered valid for assigning to `ledger_account`.
    # the resulting code should probably look something like `team.ledger_accounts`.
  end

  # 🚅 add methods above.
end
