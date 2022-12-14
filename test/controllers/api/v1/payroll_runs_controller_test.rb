require "controllers/api/v1/test"

class Api::V1::PayrollRunsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@payroll_run = build(:payroll_run, company: @company)
      @other_payroll_runs = create_list(:payroll_run, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @payroll_run.save

      @another_payroll_run = create(:payroll_run, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(payroll_run_data)
      # Fetch the payroll_run in question and prepare to compare it's attributes.
      payroll_run = PayrollRun.find(payroll_run_data["id"])

      assert_equal_or_nil Date.parse(payroll_run_data['schedule']), payroll_run.schedule
      assert_equal_or_nil payroll_run_data['employees_paid'], payroll_run.employees_paid
      assert_equal_or_nil Date.parse(payroll_run_data['check_date']), payroll_run.check_date
      assert_equal_or_nil Date.parse(payroll_run_data['pay_date']), payroll_run.pay_date
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal payroll_run_data["company_id"], payroll_run.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/payroll_runs", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      payroll_run_ids_returned = response.parsed_body.map { |payroll_run| payroll_run["id"] }
      assert_includes(payroll_run_ids_returned, @payroll_run.id)

      # But not returning other people's resources.
      assert_not_includes(payroll_run_ids_returned, @other_payroll_runs[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/payroll_runs/#{@payroll_run.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/payroll_runs/#{@payroll_run.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      payroll_run_data = JSON.parse(build(:payroll_run, company: nil).to_api_json)
      payroll_run_data.except!("id", "company_id", "created_at", "updated_at")
      params[:payroll_run] = payroll_run_data

      post "/api/v1/companies/#{@company.id}/payroll_runs", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/payroll_runs",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/payroll_runs/#{@payroll_run.id}", params: {
        access_token: access_token,
        payroll_run: {
          employees_paid: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @payroll_run.reload
      assert_equal @payroll_run.employees_paid, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/payroll_runs/#{@payroll_run.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("PayrollRun.count", -1) do
        delete "/api/v1/payroll_runs/#{@payroll_run.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/payroll_runs/#{@another_payroll_run.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
