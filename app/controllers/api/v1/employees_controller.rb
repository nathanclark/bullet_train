class Api::V1::EmployeesController < Api::V1::ApplicationController
  account_load_and_authorize_resource :employee, through: :company, through_association: :employees

  # GET /api/v1/companies/:company_id/employees
  def index
  end

  # GET /api/v1/employees/:id
  def show
  end

  # POST /api/v1/companies/:company_id/employees
  def create
    if @employee.save
      render :show, status: :created, location: [:api, :v1, @employee]
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/employees/:id
  def update
    if @employee.update(employee_params)
      render :show
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/employees/:id
  def destroy
    @employee.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def employee_params
      strong_params = params.require(:employee).permit(
        *permitted_fields,
        :employee_number,
        :employee_status,
        :first_name,
        :middle_name,
        :last_name,
        :address1,
        :address2,
        :city,
        :region_state,
        :phone_number,
        :employee_department,
        :hire_date,
        :termination,
        :payroll_schedule,
        :payroll_federal_filing_status,
        :expense_ledger_account,
        :payroll_federal_withholding_allowance,
        :payroll_federal_withholding_amount,
        :personal_time_balance,
        :vacation_time_balance,
        :sick_leave_balance,
        :compensation_increase_date,
        :next_compensation_increase_date,
        :marital_tax_status,
        :notes,
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
