class Api::V1::BankAccountsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :bank_account, through: :company, through_association: :bank_accounts

  # GET /api/v1/companies/:company_id/bank_accounts
  def index
  end

  # GET /api/v1/bank_accounts/:id
  def show
  end

  # POST /api/v1/companies/:company_id/bank_accounts
  def create
    if @bank_account.save
      render :show, status: :created, location: [:api, :v1, @bank_account]
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bank_accounts/:id
  def update
    if @bank_account.update(bank_account_params)
      render :show
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bank_accounts/:id
  def destroy
    @bank_account.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def bank_account_params
      strong_params = params.require(:bank_account).permit(
        *permitted_fields,
        :name,
        :account_number,
        :routing_number,
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
