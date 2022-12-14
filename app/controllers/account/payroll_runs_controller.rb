class Account::PayrollRunsController < Account::ApplicationController
  account_load_and_authorize_resource :payroll_run, through: :company, through_association: :payroll_runs

  # GET /account/companies/:company_id/payroll_runs
  # GET /account/companies/:company_id/payroll_runs.json
  def index
    delegate_json_to_api
  end

  # GET /account/payroll_runs/:id
  # GET /account/payroll_runs/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/payroll_runs/new
  def new
  end

  # GET /account/payroll_runs/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/payroll_runs
  # POST /account/companies/:company_id/payroll_runs.json
  def create
    respond_to do |format|
      if @payroll_run.save
        format.html { redirect_to [:account, @company, :payroll_runs], notice: I18n.t("payroll_runs.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @payroll_run] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payroll_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/payroll_runs/:id
  # PATCH/PUT /account/payroll_runs/:id.json
  def update
    respond_to do |format|
      if @payroll_run.update(payroll_run_params)
        format.html { redirect_to [:account, @payroll_run], notice: I18n.t("payroll_runs.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @payroll_run] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payroll_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/payroll_runs/:id
  # DELETE /account/payroll_runs/:id.json
  def destroy
    @payroll_run.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :payroll_runs], notice: I18n.t("payroll_runs.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    assign_date(strong_params, :schedule)
    assign_date(strong_params, :check_date)
    assign_date(strong_params, :pay_date)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
