require "controllers/api/v1/test"

class Api::V1::LedgerEntriesControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@ledger_entry = build(:ledger_entry, company: @company)
      @other_ledger_entries = create_list(:ledger_entry, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @ledger_entry.save

      @another_ledger_entry = create(:ledger_entry, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(ledger_entry_data)
      # Fetch the ledger_entry in question and prepare to compare it's attributes.
      ledger_entry = LedgerEntry.find(ledger_entry_data["id"])

      assert_equal_or_nil Date.parse(ledger_entry_data['post_date']), ledger_entry.post_date
      assert_equal_or_nil ledger_entry_data['status'], ledger_entry.status
      assert_equal_or_nil ledger_entry_data['source_type'], ledger_entry.source_type
      assert_equal_or_nil ledger_entry_data['fiscal_period'], ledger_entry.fiscal_period
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal ledger_entry_data["company_id"], ledger_entry.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/ledger_entries", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      ledger_entry_ids_returned = response.parsed_body.map { |ledger_entry| ledger_entry["id"] }
      assert_includes(ledger_entry_ids_returned, @ledger_entry.id)

      # But not returning other people's resources.
      assert_not_includes(ledger_entry_ids_returned, @other_ledger_entries[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/ledger_entries/#{@ledger_entry.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/ledger_entries/#{@ledger_entry.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      ledger_entry_data = JSON.parse(build(:ledger_entry, company: nil).to_api_json)
      ledger_entry_data.except!("id", "company_id", "created_at", "updated_at")
      params[:ledger_entry] = ledger_entry_data

      post "/api/v1/companies/#{@company.id}/ledger_entries", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/ledger_entries",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/ledger_entries/#{@ledger_entry.id}", params: {
        access_token: access_token,
        ledger_entry: {
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @ledger_entry.reload
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/ledger_entries/#{@ledger_entry.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("LedgerEntry.count", -1) do
        delete "/api/v1/ledger_entries/#{@ledger_entry.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/ledger_entries/#{@another_ledger_entry.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
