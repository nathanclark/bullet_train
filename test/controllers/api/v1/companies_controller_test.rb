require "controllers/api/v1/test"

class Api::V1::CompaniesControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = build(:company, team: @team)
      @other_companies = create_list(:company, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @company.save

      @another_company = create(:company, team: @team)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(company_data)
      # Fetch the company in question and prepare to compare it's attributes.
      company = Company.find(company_data["id"])

      assert_equal_or_nil company_data['name'], company.name
      assert_equal_or_nil company_data['legal_name'], company.legal_name
      assert_equal_or_nil company_data['ein'], company.ein
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal company_data["team_id"], company.team_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/teams/#{@team.id}/companies", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      company_ids_returned = response.parsed_body.map { |company| company["id"] }
      assert_includes(company_ids_returned, @company.id)

      # But not returning other people's resources.
      assert_not_includes(company_ids_returned, @other_companies[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/companies/#{@company.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      company_data = JSON.parse(build(:company, team: nil).to_api_json)
      company_data.except!("id", "team_id", "created_at", "updated_at")
      params[:company] = company_data

      post "/api/v1/teams/#{@team.id}/companies", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/teams/#{@team.id}/companies",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/companies/#{@company.id}", params: {
        access_token: access_token,
        company: {
          name: 'Alternative String Value',
          legal_name: 'Alternative String Value',
          ein: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @company.reload
      assert_equal @company.name, 'Alternative String Value'
      assert_equal @company.legal_name, 'Alternative String Value'
      assert_equal @company.ein, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/companies/#{@company.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("Company.count", -1) do
        delete "/api/v1/companies/#{@company.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/companies/#{@another_company.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
