class Account::PostalAddressesController < Account::ApplicationController
  #account_load_and_authorize_resource :postal_address, through: :company, through_association: :postal_addresses
  before_action :setup_company
  # GET /account/companies/:company_id/postal_addresses
  # GET /account/companies/:company_id/postal_addresses.json


  # GET /account/companies/:company_id/postal_addresses/new
  def new
  end

  # GET /account/postal_addresses/:id/edit
  def edit
  end



  # DELETE /account/postal_addresses/:id
  # DELETE /account/postal_addresses/:id.json
  def destroy

  end

  private



  def permitted_fields
    [postal_addresses_attributes:[]]
  end
  def permitted_arrays
    [:street1,:street2,:city,:state,:zipcode]
  end
  def process_params(strong_params)
    puts 'test'
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end

  private

  def setup_company
    @company = Company.new(postal_addresses: [PostalAddress.new])
  end
end
