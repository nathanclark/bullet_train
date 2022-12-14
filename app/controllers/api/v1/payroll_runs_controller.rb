class Api::V1::PayrollRunsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :payroll_run, through: :company, through_association: :payroll_runs

  # GET /api/v1/companies/:company_id/payroll_runs
  def index
  end

  # GET /api/v1/payroll_runs/:id
  def show
  end

  # POST /api/v1/companies/:company_id/payroll_runs
  def create
    if @payroll_run.save
      render :show, status: :created, location: [:api, :v1, @payroll_run]
    else
      render json: @payroll_run.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/payroll_runs/:id
  def update
    if @payroll_run.update(payroll_run_params)
      render :show
    else
      render json: @payroll_run.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/payroll_runs/:id
  def destroy
    @payroll_run.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def payroll_run_params
      strong_params = params.require(:payroll_run).permit(
        *permitted_fields,
        :schedule,
        :employees_paid,
        :check_date,
        :pay_date,
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
