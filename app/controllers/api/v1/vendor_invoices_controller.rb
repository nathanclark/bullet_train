class Api::V1::VendorInvoicesController < Api::V1::ApplicationController
  account_load_and_authorize_resource :vendor_invoice, through: :vendor, through_association: :vendor_invoices

  # GET /api/v1/vendors/:vendor_id/vendor_invoices
  def index
  end

  # GET /api/v1/vendor_invoices/:id
  def show
  end

  # POST /api/v1/vendors/:vendor_id/vendor_invoices
  def create
    if @vendor_invoice.save
      render :show, status: :created, location: [:api, :v1, @vendor_invoice]
    else
      render json: @vendor_invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/vendor_invoices/:id
  def update
    if @vendor_invoice.update(vendor_invoice_params)
      render :show
    else
      render json: @vendor_invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/vendor_invoices/:id
  def destroy
    @vendor_invoice.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def vendor_invoice_params
      strong_params = params.require(:vendor_invoice).permit(
        *permitted_fields,
        :invoice_type,
        :invoice_total,
        :reference_number,
        :invoice_number,
        :invoice_date,
        :gl_posting_date,
        :discount_total,
        :discount_expiration_date,
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
