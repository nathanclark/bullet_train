class Account::CompaniesController < Account::ApplicationController
  account_load_and_authorize_resource :company, through: :team, through_association: :companies


  # GET /account/teams/:team_id/companies
  # GET /account/teams/:team_id/companies.json
  def index
    delegate_json_to_api
  end

  # GET /account/companies/:id
  # GET /account/companies/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/teams/:team_id/companies/new
  def new
    @company.postal_addresses.new(address_type:'1')
  end

  # GET /account/companies/:id/edit
  def edit
  end

  # POST /account/teams/:team_id/companies
  # POST /account/teams/:team_id/companies.json
  def create
    respond_to do |format|
      if @company.save
        format.html { redirect_to [:account, @team, :companies], notice: I18n.t("companies.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @company] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/companies/:id
  # PATCH/PUT /account/companies/:id.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to [:account, @company], notice: I18n.t("companies.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @company] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/companies/:id
  # DELETE /account/companies/:id.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @team, :companies], notice: I18n.t("companies.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

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
end
