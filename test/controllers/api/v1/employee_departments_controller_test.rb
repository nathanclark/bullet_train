require "controllers/api/v1/test"

class Api::V1::EmployeeDepartmentsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@employee_department = build(:employee_department, company: @company)
      @other_employee_departments = create_list(:employee_department, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @employee_department.save

      @another_employee_department = create(:employee_department, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(employee_department_data)
      # Fetch the employee_department in question and prepare to compare it's attributes.
      employee_department = EmployeeDepartment.find(employee_department_data["id"])

      assert_equal_or_nil employee_department_data['name'], employee_department.name
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal employee_department_data["company_id"], employee_department.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/employee_departments", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      employee_department_ids_returned = response.parsed_body.map { |employee_department| employee_department["id"] }
      assert_includes(employee_department_ids_returned, @employee_department.id)

      # But not returning other people's resources.
      assert_not_includes(employee_department_ids_returned, @other_employee_departments[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/employee_departments/#{@employee_department.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/employee_departments/#{@employee_department.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      employee_department_data = JSON.parse(build(:employee_department, company: nil).to_api_json)
      employee_department_data.except!("id", "company_id", "created_at", "updated_at")
      params[:employee_department] = employee_department_data

      post "/api/v1/companies/#{@company.id}/employee_departments", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/employee_departments",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/employee_departments/#{@employee_department.id}", params: {
        access_token: access_token,
        employee_department: {
          name: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @employee_department.reload
      assert_equal @employee_department.name, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/employee_departments/#{@employee_department.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("EmployeeDepartment.count", -1) do
        delete "/api/v1/employee_departments/#{@employee_department.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/employee_departments/#{@another_employee_department.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
