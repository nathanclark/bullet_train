class Account::PayrollRunDetailsController < Account::ApplicationController
  account_load_and_authorize_resource :payroll_run_detail, through: :payroll_run, through_association: :payroll_run_details

  # GET /account/payroll_runs/:payroll_run_id/payroll_run_details
  # GET /account/payroll_runs/:payroll_run_id/payroll_run_details.json
  def index
    delegate_json_to_api
  end

  # GET /account/payroll_run_details/:id
  # GET /account/payroll_run_details/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/payroll_runs/:payroll_run_id/payroll_run_details/new
  def new
  end

  # GET /account/payroll_run_details/:id/edit
  def edit
  end

  # POST /account/payroll_runs/:payroll_run_id/payroll_run_details
  # POST /account/payroll_runs/:payroll_run_id/payroll_run_details.json
  def create
    respond_to do |format|
      if @payroll_run_detail.save
        format.html { redirect_to [:account, @payroll_run, :payroll_run_details], notice: I18n.t("payroll_run_details.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @payroll_run_detail] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payroll_run_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/payroll_run_details/:id
  # PATCH/PUT /account/payroll_run_details/:id.json
  def update
    respond_to do |format|
      if @payroll_run_detail.update(payroll_run_detail_params)
        format.html { redirect_to [:account, @payroll_run_detail], notice: I18n.t("payroll_run_details.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @payroll_run_detail] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payroll_run_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/payroll_run_details/:id
  # DELETE /account/payroll_run_details/:id.json
  def destroy
    @payroll_run_detail.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @payroll_run, :payroll_run_details], notice: I18n.t("payroll_run_details.notifications.destroyed") }
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
