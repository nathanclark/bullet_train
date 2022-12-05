require "controllers/api/v1/test"

class Api::V1::VendorsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@vendor = build(:vendor, company: @company)
      @other_vendors = create_list(:vendor, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @vendor.save

      @another_vendor = create(:vendor, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(vendor_data)
      # Fetch the vendor in question and prepare to compare it's attributes.
      vendor = Vendor.find(vendor_data["id"])

      assert_equal_or_nil vendor_data['name'], vendor.name
      assert_equal_or_nil vendor_data['vendor_number'], vendor.vendor_number
      assert_equal_or_nil vendor_data['is_payee'], vendor.is_payee
      assert_equal_or_nil vendor_data['ledger_account_id'], vendor.ledger_account_id
      assert_equal_or_nil vendor_data['address1'], vendor.address1
      assert_equal_or_nil vendor_data['address2'], vendor.address2
      assert_equal_or_nil vendor_data['city'], vendor.city
      assert_equal_or_nil vendor_data['region'], vendor.region
      assert_equal_or_nil vendor_data['zip_code'], vendor.zip_code
      assert_equal_or_nil vendor_data['phone_number'], vendor.phone_number
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal vendor_data["company_id"], vendor.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/vendors", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      vendor_ids_returned = response.parsed_body.map { |vendor| vendor["id"] }
      assert_includes(vendor_ids_returned, @vendor.id)

      # But not returning other people's resources.
      assert_not_includes(vendor_ids_returned, @other_vendors[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/vendors/#{@vendor.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/vendors/#{@vendor.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      vendor_data = JSON.parse(build(:vendor, company: nil).to_api_json)
      vendor_data.except!("id", "company_id", "created_at", "updated_at")
      params[:vendor] = vendor_data

      post "/api/v1/companies/#{@company.id}/vendors", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/vendors",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/vendors/#{@vendor.id}", params: {
        access_token: access_token,
        vendor: {
          name: 'Alternative String Value',
          vendor_number: 'Alternative String Value',
          address1: 'Alternative String Value',
          address2: 'Alternative String Value',
          city: 'Alternative String Value',
          region: 'Alternative String Value',
          zip_code: 'Alternative String Value',
          phone_number: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @vendor.reload
      assert_equal @vendor.name, 'Alternative String Value'
      assert_equal @vendor.vendor_number, 'Alternative String Value'
      assert_equal @vendor.address1, 'Alternative String Value'
      assert_equal @vendor.address2, 'Alternative String Value'
      assert_equal @vendor.city, 'Alternative String Value'
      assert_equal @vendor.region, 'Alternative String Value'
      assert_equal @vendor.zip_code, 'Alternative String Value'
      assert_equal @vendor.phone_number, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/vendors/#{@vendor.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("Vendor.count", -1) do
        delete "/api/v1/vendors/#{@vendor.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/vendors/#{@another_vendor.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
