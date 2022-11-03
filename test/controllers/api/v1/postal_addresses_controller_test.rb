require "controllers/api/v1/test"

class Api::V1::PostalAddressesControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@postal_address = build(:postal_address, company: @company)
      @other_postal_addresses = create_list(:postal_address, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @postal_address.save

      @another_postal_address = create(:postal_address, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(postal_address_data)
      # Fetch the postal_address in question and prepare to compare it's attributes.
      postal_address = PostalAddress.find(postal_address_data["id"])

      assert_equal_or_nil postal_address_data['address_type'], postal_address.address_type
      assert_equal_or_nil postal_address_data['street1'], postal_address.street1
      assert_equal_or_nil postal_address_data['street2'], postal_address.street2
      assert_equal_or_nil postal_address_data['city'], postal_address.city
      assert_equal_or_nil postal_address_data['state'], postal_address.state
      assert_equal_or_nil postal_address_data['zipcode'], postal_address.zipcode
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal postal_address_data["company_id"], postal_address.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/postal_addresses", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      postal_address_ids_returned = response.parsed_body.map { |postal_address| postal_address["id"] }
      assert_includes(postal_address_ids_returned, @postal_address.id)

      # But not returning other people's resources.
      assert_not_includes(postal_address_ids_returned, @other_postal_addresses[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/postal_addresses/#{@postal_address.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/postal_addresses/#{@postal_address.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      postal_address_data = JSON.parse(build(:postal_address, company: nil).to_api_json)
      postal_address_data.except!("id", "company_id", "created_at", "updated_at")
      params[:postal_address] = postal_address_data

      post "/api/v1/companies/#{@company.id}/postal_addresses", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/postal_addresses",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/postal_addresses/#{@postal_address.id}", params: {
        access_token: access_token,
        postal_address: {
          address_type: 'Alternative String Value',
          street1: 'Alternative String Value',
          street2: 'Alternative String Value',
          city: 'Alternative String Value',
          state: 'Alternative String Value',
          zipcode: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @postal_address.reload
      assert_equal @postal_address.address_type, 'Alternative String Value'
      assert_equal @postal_address.street1, 'Alternative String Value'
      assert_equal @postal_address.street2, 'Alternative String Value'
      assert_equal @postal_address.city, 'Alternative String Value'
      assert_equal @postal_address.state, 'Alternative String Value'
      assert_equal @postal_address.zipcode, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/postal_addresses/#{@postal_address.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("PostalAddress.count", -1) do
        delete "/api/v1/postal_addresses/#{@postal_address.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/postal_addresses/#{@another_postal_address.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
