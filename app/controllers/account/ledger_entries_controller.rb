class Account::LedgerEntriesController < Account::ApplicationController
  account_load_and_authorize_resource :ledger_entry, through: :company, through_association: :ledger_entries

  # GET /account/companies/:company_id/ledger_entries
  # GET /account/companies/:company_id/ledger_entries.json
  def index
    delegate_json_to_api
  end

  # GET /account/ledger_entries/:id
  # GET /account/ledger_entries/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/ledger_entries/new
  def new

    @ledger_entry.id = Time.now.to_i
    #@ledger_entry.ledger_entry_details.build()
  end

  # GET /account/ledger_entries/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/ledger_entries
  # POST /account/companies/:company_id/ledger_entries.json
  def create
    unless @ledger_entry.id
      @ledger_entry.id = Time.now.to_i
    end
    @ledger_entry.user = current_user
    respond_to do |format|
      if @ledger_entry.save
        format.html { redirect_to [:account, @company, :ledger_entries], notice: I18n.t("ledger_entries.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @ledger_entry] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ledger_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/ledger_entries/:id
  # PATCH/PUT /account/ledger_entries/:id.json
  def update
    respond_to do |format|
      if @ledger_entry.update(ledger_entry_params)
        format.html { redirect_to [:account, @ledger_entry], notice: I18n.t("ledger_entries.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @ledger_entry] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ledger_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/ledger_entries/:id
  # DELETE /account/ledger_entries/:id.json
  def destroy
    @ledger_entry.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :ledger_entries], notice: I18n.t("ledger_entries.notifications.destroyed") }
      format.json { head :no_content }
    end
  end
  def ledger_entry_detail_field
    @ledger_entry_detail = LedgerEntryDetail.new({company_id:params['company_id']})
    puts 's'
  end
  private

  include strong_parameters_from_api

  def process_params(strong_params)
    assign_date(strong_params, :post_date)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
