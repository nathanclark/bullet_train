class Account::LedgerAccountsController < Account::ApplicationController
  account_load_and_authorize_resource :ledger_account, through: :company, through_association: :ledger_accounts

  # GET /account/companies/:company_id/ledger_accounts
  # GET /account/companies/:company_id/ledger_accounts.json
  def index
    delegate_json_to_api
  end

  # GET /account/ledger_accounts/:id
  # GET /account/ledger_accounts/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/ledger_accounts/new
  def new
  end

  # GET /account/ledger_accounts/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/ledger_accounts
  # POST /account/companies/:company_id/ledger_accounts.json
  def create
    respond_to do |format|
      if @ledger_account.save
        format.html { redirect_to [:account, @company, :ledger_accounts], notice: I18n.t("ledger_accounts.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @ledger_account] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ledger_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/ledger_accounts/:id
  # PATCH/PUT /account/ledger_accounts/:id.json
  def update
    respond_to do |format|
      if @ledger_account.update(ledger_account_params)
        format.html { redirect_to [:account, @ledger_account], notice: I18n.t("ledger_accounts.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @ledger_account] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ledger_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/ledger_accounts/:id
  # DELETE /account/ledger_accounts/:id.json
  def destroy
    @ledger_account.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :ledger_accounts], notice: I18n.t("ledger_accounts.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
