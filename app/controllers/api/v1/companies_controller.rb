class Api::V1::CompaniesController < Api::V1::ApplicationController
  account_load_and_authorize_resource :company, through: :team, through_association: :companies

  # GET /api/v1/teams/:team_id/companies
  def index

  end

  # GET /api/v1/companies/:id
  def show
  end

  # POST /api/v1/teams/:team_id/companies
  def create
    if @company.save
      render :show, status: :created, location: [:api, :v1, @company]
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/companies/:id
  def update
    if @company.update(company_params)
      render :show
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/companies/:id
  def destroy
    @company.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def company_params
      strong_params = params.require(:company).permit(
        :name,
        :legal_name,
        :ein,
        postal_addresses_attributes:[:id,:address_type,:street1,:street2,:city,:state,:zipcode,:_destroy],
        contacts_attributes:[:id,:contact_type,:first_name,:last_name,:title,:email,:fax_number,:cell_number,:work_number,:social_link,:cloudinary_image,:company_role,:_destroy]
      )
      process_params(strong_params)
      strong_params
    end
  end
  include StrongParameters
end
