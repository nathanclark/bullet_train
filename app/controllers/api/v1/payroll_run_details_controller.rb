class Api::V1::PayrollRunDetailsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :payroll_run_detail, through: :payroll_run, through_association: :payroll_run_details

  # GET /api/v1/payroll_runs/:payroll_run_id/payroll_run_details
  def index
  end

  # GET /api/v1/payroll_run_details/:id
  def show
  end

  # POST /api/v1/payroll_runs/:payroll_run_id/payroll_run_details
  def create
    if @payroll_run_detail.save
      render :show, status: :created, location: [:api, :v1, @payroll_run_detail]
    else
      render json: @payroll_run_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/payroll_run_details/:id
  def update
    if @payroll_run_detail.update(payroll_run_detail_params)
      render :show
    else
      render json: @payroll_run_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/payroll_run_details/:id
  def destroy
    @payroll_run_detail.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def payroll_run_detail_params
      strong_params = params.require(:payroll_run_detail).permit(
        *permitted_fields,
        :bank_account_id,
        :schedule,
        :employees_paid,
        :check_date,
        :pay_date,
        :employee_id,
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
