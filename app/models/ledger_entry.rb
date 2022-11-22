class LedgerEntry < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  belongs_to :user
  # 🚅 add belongs_to associations above.

  has_many :ledger_entry_details, dependent: :destroy, enable_updates: true, inverse_of: :company
  accepts_nested_attributes_for :ledger_entry_details, allow_destroy: true, reject_if: :all_blank
  validates_associated :ledger_entry_details
  # 🚅 add has_many associations above.

  has_one :team, through: :company
  has_rich_text :note
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :post_date, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
end
