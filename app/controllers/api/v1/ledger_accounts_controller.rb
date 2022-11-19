class Api::V1::LedgerAccountsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :ledger_account, through: :company, through_association: :ledger_accounts

  # GET /api/v1/companies/:company_id/ledger_accounts
  def index
  end

  # GET /api/v1/ledger_accounts/:id
  def show
  end

  # POST /api/v1/companies/:company_id/ledger_accounts
  def create
    if @ledger_account.save
      render :show, status: :created, location: [:api, :v1, @ledger_account]
    else
      render json: @ledger_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/ledger_accounts/:id
  def update
    if @ledger_account.update(ledger_account_params)
      render :show
    else
      render json: @ledger_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/ledger_accounts/:id
  def destroy
    @ledger_account.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def ledger_account_params
      strong_params = params.require(:ledger_account).permit(
        *permitted_fields,
        :title,
        :ledger_account_number,
        :account_type,
        :account_status,
        :posting_type,
        :alternate_account_number,
        :parent_id,
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
