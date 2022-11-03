class Account::PostalAddressesController < Account::ApplicationController
  account_load_and_authorize_resource :postal_address, through: :company, through_association: :postal_addresses

  # GET /account/companies/:company_id/postal_addresses
  # GET /account/companies/:company_id/postal_addresses.json
  def index
    delegate_json_to_api
  end

  # GET /account/postal_addresses/:id
  # GET /account/postal_addresses/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/postal_addresses/new
  def new
  end

  # GET /account/postal_addresses/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/postal_addresses
  # POST /account/companies/:company_id/postal_addresses.json
  def create
    respond_to do |format|
      if @postal_address.save
        format.html { redirect_to [:account, @company, :postal_addresses], notice: I18n.t("postal_addresses.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @postal_address] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @postal_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/postal_addresses/:id
  # PATCH/PUT /account/postal_addresses/:id.json
  def update
    respond_to do |format|
      if @postal_address.update(postal_address_params)
        format.html { redirect_to [:account, @postal_address], notice: I18n.t("postal_addresses.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @postal_address] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postal_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/postal_addresses/:id
  # DELETE /account/postal_addresses/:id.json
  def destroy
    @postal_address.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :postal_addresses], notice: I18n.t("postal_addresses.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
