require "controllers/api/v1/test"

class Api::V1::LedgerEntryDetailsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@ledger_entry = create(:ledger_entry, company: @company)
@ledger_entry_detail = build(:ledger_entry_detail, ledger_entry: @ledger_entry)
      @other_ledger_entry_details = create_list(:ledger_entry_detail, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @ledger_entry_detail.save

      @another_ledger_entry_detail = create(:ledger_entry_detail, ledger_entry: @ledger_entry)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(ledger_entry_detail_data)
      # Fetch the ledger_entry_detail in question and prepare to compare it's attributes.
      ledger_entry_detail = LedgerEntryDetail.find(ledger_entry_detail_data["id"])

      assert_equal_or_nil ledger_entry_detail_data['order_number'], ledger_entry_detail.order_number
      assert_equal_or_nil ledger_entry_detail_data['amount'], ledger_entry_detail.amount
      assert_equal_or_nil ledger_entry_detail_data['note'], ledger_entry_detail.note
      assert_equal_or_nil ledger_entry_detail_data['ledger_account'], ledger_entry_detail.ledger_account
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal ledger_entry_detail_data["ledger_entry_id"], ledger_entry_detail.ledger_entry_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/ledger_entries/#{@ledger_entry.id}/ledger_entry_details", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      ledger_entry_detail_ids_returned = response.parsed_body.map { |ledger_entry_detail| ledger_entry_detail["id"] }
      assert_includes(ledger_entry_detail_ids_returned, @ledger_entry_detail.id)

      # But not returning other people's resources.
      assert_not_includes(ledger_entry_detail_ids_returned, @other_ledger_entry_details[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/ledger_entry_details/#{@ledger_entry_detail.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/ledger_entry_details/#{@ledger_entry_detail.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      ledger_entry_detail_data = JSON.parse(build(:ledger_entry_detail, ledger_entry: nil).to_api_json)
      ledger_entry_detail_data.except!("id", "ledger_entry_id", "created_at", "updated_at")
      params[:ledger_entry_detail] = ledger_entry_detail_data

      post "/api/v1/ledger_entries/#{@ledger_entry.id}/ledger_entry_details", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/ledger_entries/#{@ledger_entry.id}/ledger_entry_details",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/ledger_entry_details/#{@ledger_entry_detail.id}", params: {
        access_token: access_token,
        ledger_entry_detail: {
          order_number: 'Alternative String Value',
          amount: 'Alternative String Value',
          note: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @ledger_entry_detail.reload
      assert_equal @ledger_entry_detail.order_number, 'Alternative String Value'
      assert_equal @ledger_entry_detail.amount, 'Alternative String Value'
      assert_equal @ledger_entry_detail.note, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/ledger_entry_details/#{@ledger_entry_detail.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("LedgerEntryDetail.count", -1) do
        delete "/api/v1/ledger_entry_details/#{@ledger_entry_detail.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/ledger_entry_details/#{@another_ledger_entry_detail.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
