class Account::EmployeesController < Account::ApplicationController
  account_load_and_authorize_resource :employee, through: :company, through_association: :employees

  # GET /account/companies/:company_id/employees
  # GET /account/companies/:company_id/employees.json
  def index
    delegate_json_to_api
  end

  # GET /account/employees/:id
  # GET /account/employees/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/companies/:company_id/employees/new
  def new
  end

  # GET /account/employees/:id/edit
  def edit
  end

  # POST /account/companies/:company_id/employees
  # POST /account/companies/:company_id/employees.json
  def create
    respond_to do |format|
      if @employee.save
        format.html { redirect_to [:account, @company, :employees], notice: I18n.t("employees.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @employee] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/employees/:id
  # PATCH/PUT /account/employees/:id.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to [:account, @employee], notice: I18n.t("employees.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @employee] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/employees/:id
  # DELETE /account/employees/:id.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @company, :employees], notice: I18n.t("employees.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  include strong_parameters_from_api

  def process_params(strong_params)
    assign_date(strong_params, :hire_date)
    assign_date(strong_params, :termination)
    assign_date(strong_params, :compensation_increase_date)
    assign_date(strong_params, :next_compensation_increase_date)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
