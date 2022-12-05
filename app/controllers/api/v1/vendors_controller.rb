class Api::V1::VendorsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :vendor, through: :company, through_association: :vendors

  # GET /api/v1/companies/:company_id/vendors
  def index
  end

  # GET /api/v1/vendors/:id
  def show
  end

  # POST /api/v1/companies/:company_id/vendors
  def create
    if @vendor.save
      render :show, status: :created, location: [:api, :v1, @vendor]
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/vendors/:id
  def update
    if @vendor.update(vendor_params)
      render :show
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/vendors/:id
  def destroy
    @vendor.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def vendor_params
      strong_params = params.require(:vendor).permit(
        *permitted_fields,
        :name,
        :vendor_number,
        :is_payee,
        :ledger_account_id,
        :address1,
        :address2,
        :city,
        :region,
        :zip_code,
        :phone_number,
        # 🚅 super scaffolding will insert new fields above this line.
        *permitted_arrays,
        # 🚅 super scaffolding will insert new arrays above this line.
      )

      process_params(strong_params)

      strong_params
    end
  end

  include StrongParameters
end
