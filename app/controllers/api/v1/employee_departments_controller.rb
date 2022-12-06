class Api::V1::EmployeeDepartmentsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :employee_department, through: :company, through_association: :employee_departments

  # GET /api/v1/companies/:company_id/employee_departments
  def index
  end

  # GET /api/v1/employee_departments/:id
  def show
  end

  # POST /api/v1/companies/:company_id/employee_departments
  def create
    if @employee_department.save
      render :show, status: :created, location: [:api, :v1, @employee_department]
    else
      render json: @employee_department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/employee_departments/:id
  def update
    if @employee_department.update(employee_department_params)
      render :show
    else
      render json: @employee_department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/employee_departments/:id
  def destroy
    @employee_department.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def employee_department_params
      strong_params = params.require(:employee_department).permit(
        *permitted_fields,
        :name,
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
