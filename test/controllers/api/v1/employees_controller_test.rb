require "controllers/api/v1/test"

class Api::V1::EmployeesControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@employee = build(:employee, company: @company)
      @other_employees = create_list(:employee, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @employee.save

      @another_employee = create(:employee, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(employee_data)
      # Fetch the employee in question and prepare to compare it's attributes.
      employee = Employee.find(employee_data["id"])

      assert_equal_or_nil employee_data['employee_number'], employee.employee_number
      assert_equal_or_nil employee_data['employee_status'], employee.employee_status
      assert_equal_or_nil employee_data['first_name'], employee.first_name
      assert_equal_or_nil employee_data['middle_name'], employee.middle_name
      assert_equal_or_nil employee_data['last_name'], employee.last_name
      assert_equal_or_nil employee_data['address1'], employee.address1
      assert_equal_or_nil employee_data['address2'], employee.address2
      assert_equal_or_nil employee_data['city'], employee.city
      assert_equal_or_nil employee_data['region_state'], employee.region_state
      assert_equal_or_nil employee_data['phone_number'], employee.phone_number
      assert_equal_or_nil employee_data['employee_department'], employee.employee_department
      assert_equal_or_nil Date.parse(employee_data['hire_date']), employee.hire_date
      assert_equal_or_nil Date.parse(employee_data['termination']), employee.termination
      assert_equal_or_nil employee_data['payroll_schedule'], employee.payroll_schedule
      assert_equal_or_nil employee_data['payroll_federal_filing_status'], employee.payroll_federal_filing_status
      assert_equal_or_nil employee_data['expense_ledger_account'], employee.expense_ledger_account
      assert_equal_or_nil employee_data['payroll_federal_withholding_allowance'], employee.payroll_federal_withholding_allowance
      assert_equal_or_nil employee_data['payroll_federal_withholding_amount'], employee.payroll_federal_withholding_amount
      assert_equal_or_nil employee_data['personal_time_balance'], employee.personal_time_balance
      assert_equal_or_nil employee_data['vacation_time_balance'], employee.vacation_time_balance
      assert_equal_or_nil employee_data['sick_leave_balance'], employee.sick_leave_balance
      assert_equal_or_nil Date.parse(employee_data['compensation_increase_date']), employee.compensation_increase_date
      assert_equal_or_nil Date.parse(employee_data['next_compensation_increase_date']), employee.next_compensation_increase_date
      assert_equal_or_nil employee_data['marital_tax_status'], employee.marital_tax_status
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal employee_data["company_id"], employee.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/employees", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      employee_ids_returned = response.parsed_body.map { |employee| employee["id"] }
      assert_includes(employee_ids_returned, @employee.id)

      # But not returning other people's resources.
      assert_not_includes(employee_ids_returned, @other_employees[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/employees/#{@employee.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/employees/#{@employee.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      employee_data = JSON.parse(build(:employee, company: nil).to_api_json)
      employee_data.except!("id", "company_id", "created_at", "updated_at")
      params[:employee] = employee_data

      post "/api/v1/companies/#{@company.id}/employees", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/employees",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/employees/#{@employee.id}", params: {
        access_token: access_token,
        employee: {
          employee_number: 'Alternative String Value',
          employee_status: 'Alternative String Value',
          first_name: 'Alternative String Value',
          middle_name: 'Alternative String Value',
          last_name: 'Alternative String Value',
          address1: 'Alternative String Value',
          address2: 'Alternative String Value',
          city: 'Alternative String Value',
          region_state: 'Alternative String Value',
          phone_number: 'Alternative String Value',
          payroll_federal_withholding_amount: 'Alternative String Value',
          personal_time_balance: 'Alternative String Value',
          vacation_time_balance: 'Alternative String Value',
          sick_leave_balance: 'Alternative String Value',
          marital_tax_status: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @employee.reload
      assert_equal @employee.employee_number, 'Alternative String Value'
      assert_equal @employee.employee_status, 'Alternative String Value'
      assert_equal @employee.first_name, 'Alternative String Value'
      assert_equal @employee.middle_name, 'Alternative String Value'
      assert_equal @employee.last_name, 'Alternative String Value'
      assert_equal @employee.address1, 'Alternative String Value'
      assert_equal @employee.address2, 'Alternative String Value'
      assert_equal @employee.city, 'Alternative String Value'
      assert_equal @employee.region_state, 'Alternative String Value'
      assert_equal @employee.phone_number, 'Alternative String Value'
      assert_equal @employee.payroll_federal_withholding_amount, 'Alternative String Value'
      assert_equal @employee.personal_time_balance, 'Alternative String Value'
      assert_equal @employee.vacation_time_balance, 'Alternative String Value'
      assert_equal @employee.sick_leave_balance, 'Alternative String Value'
      assert_equal @employee.marital_tax_status, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/employees/#{@employee.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("Employee.count", -1) do
        delete "/api/v1/employees/#{@employee.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/employees/#{@another_employee.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
