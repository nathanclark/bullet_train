require "controllers/api/v1/test"

class Api::V1::LedgerAccountsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@ledger_account = build(:ledger_account, company: @company)
      @other_ledger_accounts = create_list(:ledger_account, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @ledger_account.save

      @another_ledger_account = create(:ledger_account, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(ledger_account_data)
      # Fetch the ledger_account in question and prepare to compare it's attributes.
      ledger_account = LedgerAccount.find(ledger_account_data["id"])

      assert_equal_or_nil ledger_account_data['title'], ledger_account.title
      assert_equal_or_nil ledger_account_data['ledger_account_number'], ledger_account.ledger_account_number
      assert_equal_or_nil ledger_account_data['account_type'], ledger_account.account_type
      assert_equal_or_nil ledger_account_data['account_status'], ledger_account.account_status
      assert_equal_or_nil ledger_account_data['posting_type'], ledger_account.posting_type
      assert_equal_or_nil ledger_account_data['alternate_account_number'], ledger_account.alternate_account_number
      assert_equal_or_nil ledger_account_data['parent_id'], ledger_account.parent_id
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal ledger_account_data["company_id"], ledger_account.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/ledger_accounts", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      ledger_account_ids_returned = response.parsed_body.map { |ledger_account| ledger_account["id"] }
      assert_includes(ledger_account_ids_returned, @ledger_account.id)

      # But not returning other people's resources.
      assert_not_includes(ledger_account_ids_returned, @other_ledger_accounts[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/ledger_accounts/#{@ledger_account.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/ledger_accounts/#{@ledger_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      ledger_account_data = JSON.parse(build(:ledger_account, company: nil).to_api_json)
      ledger_account_data.except!("id", "company_id", "created_at", "updated_at")
      params[:ledger_account] = ledger_account_data

      post "/api/v1/companies/#{@company.id}/ledger_accounts", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/ledger_accounts",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/ledger_accounts/#{@ledger_account.id}", params: {
        access_token: access_token,
        ledger_account: {
          title: 'Alternative String Value',
          ledger_account_number: 'Alternative String Value',
          alternate_account_number: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @ledger_account.reload
      assert_equal @ledger_account.title, 'Alternative String Value'
      assert_equal @ledger_account.ledger_account_number, 'Alternative String Value'
      assert_equal @ledger_account.alternate_account_number, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/ledger_accounts/#{@ledger_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("LedgerAccount.count", -1) do
        delete "/api/v1/ledger_accounts/#{@ledger_account.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/ledger_accounts/#{@another_ledger_account.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
