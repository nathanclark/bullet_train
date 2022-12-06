class Company < ApplicationRecord
  validates :name, presence: true
  belongs_to :team

  has_many :postal_addresses, dependent: :destroy, enable_updates: true, inverse_of: :company
  accepts_nested_attributes_for :postal_addresses, allow_destroy: true, reject_if: :all_blank
  validates_associated :postal_addresses

  has_many :contacts, dependent: :destroy, enable_updates: true, inverse_of: :company
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank
  validates_associated :contacts

  has_many :ledger_accounts, dependent: :destroy, enable_updates: true, inverse_of: :company
  accepts_nested_attributes_for :ledger_accounts, allow_destroy: true, reject_if: :all_blank
  validates_associated :ledger_accounts

  has_many :ledger_entries, enable_updates: true
  has_many :vendors, enable_updates: true
  has_many :employee_departments, enable_updates: true
end
