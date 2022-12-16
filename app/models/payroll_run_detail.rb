class PayrollRunDetail < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :payroll_run
  belongs_to :bank_account
  belongs_to :employee, optional: true
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :payroll_run
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :bank_account, scope: true
  validates :employee, scope: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_bank_accounts
    payroll_run.company.bank_accounts
    # please specify what objects should be considered valid for assigning to `bank_account`.
    # the resulting code should probably look something like `team.bank_accounts`.
  end

  def valid_employees
    payroll_run.company.employees
    # please specify what objects should be considered valid for assigning to `employee`.
    # the resulting code should probably look something like `team.employees`.
  end

  # 🚅 add methods above.
end
