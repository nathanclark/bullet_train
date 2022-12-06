class Account::EmployeeDepartmentsController < Account::ApplicationController
  account_load_and_authorize_resource :employee_department, through: :company, through_association: :employee_departments

  # GET /account/companies/:company_id/employee_departments
  # GET /account/companies/:company_id/employee_departments.json
  def index
    delegate_json_to_api
  end

  # GET /account/employee_departments/:id
  # GET /account/employee_departments/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/employee_departments/new
  def new
  end

  # GET /account/employee_departments/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/employee_departments
  # POST /account/companies/:company_id/employee_departments.json
  def create
    respond_to do |format|
      if @employee_department.save
        format.html { redirect_to [:account, @company, :employee_departments], notice: I18n.t("employee_departments.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @employee_department] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/employee_departments/:id
  # PATCH/PUT /account/employee_departments/:id.json
  def update
    respond_to do |format|
      if @employee_department.update(employee_department_params)
        format.html { redirect_to [:account, @employee_department], notice: I18n.t("employee_departments.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @employee_department] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/employee_departments/:id
  # DELETE /account/employee_departments/:id.json
  def destroy
    @employee_department.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :employee_departments], notice: I18n.t("employee_departments.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
