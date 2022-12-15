class Employee < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  belongs_to :employee_department
  belongs_to :payroll_schedule
  belongs_to :payroll_federal_filing_status
  belongs_to :ledger_account
  belongs_to :payroll_federal_withholding_allowance
  belongs_to :eto_type
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :company
  has_rich_text :notes
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :employee_number, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.
  enum employee_type: { salary:'salary', hourly:'hourly' }
  # 🚅 add methods above.
end
