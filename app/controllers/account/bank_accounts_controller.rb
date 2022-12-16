class Account::BankAccountsController < Account::ApplicationController
  account_load_and_authorize_resource :bank_account, through: :company, through_association: :bank_accounts

  # GET /account/companies/:company_id/bank_accounts
  # GET /account/companies/:company_id/bank_accounts.json
  def index
    delegate_json_to_api
  end

  # GET /account/bank_accounts/:id
  # GET /account/bank_accounts/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/bank_accounts/new
  def new
  end

  # GET /account/bank_accounts/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/bank_accounts
  # POST /account/companies/:company_id/bank_accounts.json
  def create
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to [:account, @company, :bank_accounts], notice: I18n.t("bank_accounts.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @bank_account] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/bank_accounts/:id
  # PATCH/PUT /account/bank_accounts/:id.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to [:account, @bank_account], notice: I18n.t("bank_accounts.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @bank_account] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/bank_accounts/:id
  # DELETE /account/bank_accounts/:id.json
  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :bank_accounts], notice: I18n.t("bank_accounts.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
