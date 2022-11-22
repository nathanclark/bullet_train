class Api::V1::LedgerEntryDetailsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :ledger_entry_detail, through: :ledger_entry, through_association: :ledger_entry_details

  # GET /api/v1/ledger_entries/:ledger_entry_id/ledger_entry_details
  def index
  end

  # GET /api/v1/ledger_entry_details/:id
  def show
  end

  # POST /api/v1/ledger_entries/:ledger_entry_id/ledger_entry_details
  def create
    if @ledger_entry_detail.save
      render :show, status: :created, location: [:api, :v1, @ledger_entry_detail]
    else
      render json: @ledger_entry_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/ledger_entry_details/:id
  def update
    if @ledger_entry_detail.update(ledger_entry_detail_params)
      render :show
    else
      render json: @ledger_entry_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/ledger_entry_details/:id
  def destroy
    @ledger_entry_detail.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def ledger_entry_detail_params
      strong_params = params.require(:ledger_entry_detail).permit(
        *permitted_fields,
        :order_number,
        :amount,
        :note,
        :ledger_account_id,
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
