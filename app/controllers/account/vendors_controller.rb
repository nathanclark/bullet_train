class Account::VendorsController < Account::ApplicationController
  account_load_and_authorize_resource :vendor, through: :company, through_association: :vendors

  # GET /account/companies/:company_id/vendors
  # GET /account/companies/:company_id/vendors.json
  def index
    delegate_json_to_api
  end

  # GET /account/vendors/:id
  # GET /account/vendors/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/vendors/new
  def new
  end

  # GET /account/vendors/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/vendors
  # POST /account/companies/:company_id/vendors.json
  def create
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to [:account, @company, :vendors], notice: I18n.t("vendors.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @vendor] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/vendors/:id
  # PATCH/PUT /account/vendors/:id.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to [:account, @vendor], notice: I18n.t("vendors.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @vendor] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/vendors/:id
  # DELETE /account/vendors/:id.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :vendors], notice: I18n.t("vendors.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
