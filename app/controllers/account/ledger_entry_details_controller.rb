class Account::LedgerEntryDetailsController < Account::ApplicationController
  account_load_and_authorize_resource :ledger_entry_detail, through: :ledger_entry, through_association: :ledger_entry_details

  # GET /account/ledger_entries/:ledger_entry_id/ledger_entry_details
  # GET /account/ledger_entries/:ledger_entry_id/ledger_entry_details.json
  def index
    delegate_json_to_api
  end

  # GET /account/ledger_entry_details/:id
  # GET /account/ledger_entry_details/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/ledger_entries/:ledger_entry_id/ledger_entry_details/new
  def new
  end

  # GET /account/ledger_entry_details/:id/edit
  def edit
  end

  # POST /account/ledger_entries/:ledger_entry_id/ledger_entry_details
  # POST /account/ledger_entries/:ledger_entry_id/ledger_entry_details.json
  def create

    respond_to do |format|
      if @ledger_entry_detail.save
        format.html { redirect_to [:account, @ledger_entry, :ledger_entry_details], notice: I18n.t("ledger_entry_details.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @ledger_entry_detail] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ledger_entry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/ledger_entry_details/:id
  # PATCH/PUT /account/ledger_entry_details/:id.json
  def update
    respond_to do |format|
      if @ledger_entry_detail.update(ledger_entry_detail_params)
        format.html { redirect_to [:account, @ledger_entry_detail], notice: I18n.t("ledger_entry_details.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @ledger_entry_detail] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ledger_entry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/ledger_entry_details/:id
  # DELETE /account/ledger_entry_details/:id.json
  def destroy
    @ledger_entry_detail.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @ledger_entry, :ledger_entry_details], notice: I18n.t("ledger_entry_details.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
