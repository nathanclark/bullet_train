class Company < ApplicationRecord
  belongs_to :team
  has_many :postal_addresses, dependent: :destroy, enable_updates: true, inverse_of: :company
  accepts_nested_attributes_for :postal_addresses, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
  validates_associated :postal_addresses
end
