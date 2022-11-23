class Api::V1::LedgerEntriesController < Api::V1::ApplicationController
  account_load_and_authorize_resource :ledger_entry, through: :company, through_association: :ledger_entries

  # GET /api/v1/companies/:company_id/ledger_entries
  def index
  end

  # GET /api/v1/ledger_entries/:id
  def show
  end

  # POST /api/v1/companies/:company_id/ledger_entries
  def create
    if @ledger_entry.save
      render :show, status: :created, location: [:api, :v1, @ledger_entry]
    else
      render json: @ledger_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/ledger_entries/:id
  def update
    if @ledger_entry.update(ledger_entry_params)
      render :show
    else
      render json: @ledger_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/ledger_entries/:id
  def destroy
    @ledger_entry.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def ledger_entry_params
      strong_params = params.require(:ledger_entry).permit(

        :post_date,
        :status,
        :note,
        :source_type,
        :fiscal_period,
        ledger_entry_details_attributes:[:id,
                                         :order_number,
                                         :amount,
                                         :note,

                                         :company_id,
                                         :ledger_account_id],
      )

      process_params(strong_params)

      strong_params
    end
  end

  include StrongParameters
end
