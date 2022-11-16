class Api::V1::PostalAddressesController < Api::V1::ApplicationController
  account_load_and_authorize_resource :postal_address, through: :company, through_association: :postal_addresses

  # GET /api/v1/companies/:company_id/postal_addresses
  def index
  end

  # GET /api/v1/postal_addresses/:id
  def show
  end

  # POST /api/v1/companies/:company_id/postal_addresses
  def create
    if @postal_address.save
      render :show, status: :created, location: [:api, :v1, @postal_address]
    else
      render json: @postal_address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/postal_addresses/:id
  def update
    if @postal_address.update(postal_address_params)
      render :show
    else
      render json: @postal_address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/postal_addresses/:id
  def destroy
    @postal_address.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def postal_address_params
      strong_params = params.require(:company).permit(
        postal_addresses_attributes:[:address_type,:street1,:street2,:city,:state,:zipcode]
      )

      process_params(strong_params)

      strong_params
    end
  end

  include StrongParameters
end
