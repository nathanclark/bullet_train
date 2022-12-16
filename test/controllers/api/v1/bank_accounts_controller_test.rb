require "controllers/api/v1/test"

class Api::V1::BankAccountsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@bank_account = build(:bank_account, company: @company)
      @other_bank_accounts = create_list(:bank_account, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @bank_account.save

      @another_bank_account = create(:bank_account, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(bank_account_data)
      # Fetch the bank_account in question and prepare to compare it's attributes.
      bank_account = BankAccount.find(bank_account_data["id"])

      assert_equal_or_nil bank_account_data['name'], bank_account.name
      assert_equal_or_nil bank_account_data['account_number'], bank_account.account_number
      assert_equal_or_nil bank_account_data['routing_number'], bank_account.routing_number
      assert_equal_or_nil bank_account_data['ledger_account_id'], bank_account.ledger_account_id
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal bank_account_data["company_id"], bank_account.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/bank_accounts", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      bank_account_ids_returned = response.parsed_body.map { |bank_account| bank_account["id"] }
      assert_includes(bank_account_ids_returned, @bank_account.id)

      # But not returning other people's resources.
      assert_not_includes(bank_account_ids_returned, @other_bank_accounts[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/bank_accounts/#{@bank_account.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/bank_accounts/#{@bank_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      bank_account_data = JSON.parse(build(:bank_account, company: nil).to_api_json)
      bank_account_data.except!("id", "company_id", "created_at", "updated_at")
      params[:bank_account] = bank_account_data

      post "/api/v1/companies/#{@company.id}/bank_accounts", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/bank_accounts",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/bank_accounts/#{@bank_account.id}", params: {
        access_token: access_token,
        bank_account: {
          name: 'Alternative String Value',
          account_number: 'Alternative String Value',
          routing_number: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @bank_account.reload
      assert_equal @bank_account.name, 'Alternative String Value'
      assert_equal @bank_account.account_number, 'Alternative String Value'
      assert_equal @bank_account.routing_number, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/bank_accounts/#{@bank_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("BankAccount.count", -1) do
        delete "/api/v1/bank_accounts/#{@bank_account.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/bank_accounts/#{@another_bank_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
