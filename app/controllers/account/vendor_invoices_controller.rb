class Account::VendorInvoicesController < Account::ApplicationController
  account_load_and_authorize_resource :vendor_invoice, through: :vendor, through_association: :vendor_invoices

  # GET /account/vendors/:vendor_id/vendor_invoices
  # GET /account/vendors/:vendor_id/vendor_invoices.json
  def index
    delegate_json_to_api
  end

  # GET /account/vendor_invoices/:id
  # GET /account/vendor_invoices/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/vendors/:vendor_id/vendor_invoices/new
  def new
  end

  # GET /account/vendor_invoices/:id/edit
  def edit
  end

  # POST /account/vendors/:vendor_id/vendor_invoices
  # POST /account/vendors/:vendor_id/vendor_invoices.json
  def create
    respond_to do |format|
      if @vendor_invoice.save
        format.html { redirect_to [:account, @vendor, :vendor_invoices], notice: I18n.t("vendor_invoices.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @vendor_invoice] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/vendor_invoices/:id
  # PATCH/PUT /account/vendor_invoices/:id.json
  def update
    respond_to do |format|
      if @vendor_invoice.update(vendor_invoice_params)
        format.html { redirect_to [:account, @vendor_invoice], notice: I18n.t("vendor_invoices.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @vendor_invoice] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/vendor_invoices/:id
  # DELETE /account/vendor_invoices/:id.json
  def destroy
    @vendor_invoice.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @vendor, :vendor_invoices], notice: I18n.t("vendor_invoices.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    assign_date(strong_params, :invoice_date)
    assign_date(strong_params, :gl_posting_date)
    assign_date(strong_params, :discount_expiration_date)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
