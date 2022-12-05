require "controllers/api/v1/test"

class Api::V1::VendorInvoicesControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@vendor = create(:vendor, company: @company)
@vendor_invoice = build(:vendor_invoice, vendor: @vendor)
      @other_vendor_invoices = create_list(:vendor_invoice, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @vendor_invoice.save

      @another_vendor_invoice = create(:vendor_invoice, vendor: @vendor)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(vendor_invoice_data)
      # Fetch the vendor_invoice in question and prepare to compare it's attributes.
      vendor_invoice = VendorInvoice.find(vendor_invoice_data["id"])

      assert_equal_or_nil vendor_invoice_data['invoice_type'], vendor_invoice.invoice_type
      assert_equal_or_nil vendor_invoice_data['invoice_total'], vendor_invoice.invoice_total
      assert_equal_or_nil vendor_invoice_data['reference_number'], vendor_invoice.reference_number
      assert_equal_or_nil vendor_invoice_data['invoice_number'], vendor_invoice.invoice_number
      assert_equal_or_nil Date.parse(vendor_invoice_data['invoice_date']), vendor_invoice.invoice_date
      assert_equal_or_nil Date.parse(vendor_invoice_data['gl_posting_date']), vendor_invoice.gl_posting_date
      assert_equal_or_nil vendor_invoice_data['discount_total'], vendor_invoice.discount_total
      assert_equal_or_nil Date.parse(vendor_invoice_data['discount_expiration_date']), vendor_invoice.discount_expiration_date
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal vendor_invoice_data["vendor_id"], vendor_invoice.vendor_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/vendors/#{@vendor.id}/vendor_invoices", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      vendor_invoice_ids_returned = response.parsed_body.map { |vendor_invoice| vendor_invoice["id"] }
      assert_includes(vendor_invoice_ids_returned, @vendor_invoice.id)

      # But not returning other people's resources.
      assert_not_includes(vendor_invoice_ids_returned, @other_vendor_invoices[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/vendor_invoices/#{@vendor_invoice.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/vendor_invoices/#{@vendor_invoice.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      vendor_invoice_data = JSON.parse(build(:vendor_invoice, vendor: nil).to_api_json)
      vendor_invoice_data.except!("id", "vendor_id", "created_at", "updated_at")
      params[:vendor_invoice] = vendor_invoice_data

      post "/api/v1/vendors/#{@vendor.id}/vendor_invoices", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/vendors/#{@vendor.id}/vendor_invoices",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/vendor_invoices/#{@vendor_invoice.id}", params: {
        access_token: access_token,
        vendor_invoice: {
          invoice_type: 'Alternative String Value',
          invoice_total: 'Alternative String Value',
          reference_number: 'Alternative String Value',
          invoice_number: 'Alternative String Value',
          discount_total: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @vendor_invoice.reload
      assert_equal @vendor_invoice.invoice_type, 'Alternative String Value'
      assert_equal @vendor_invoice.invoice_total, 'Alternative String Value'
      assert_equal @vendor_invoice.reference_number, 'Alternative String Value'
      assert_equal @vendor_invoice.invoice_number, 'Alternative String Value'
      assert_equal @vendor_invoice.discount_total, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/vendor_invoices/#{@vendor_invoice.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("VendorInvoice.count", -1) do
        delete "/api/v1/vendor_invoices/#{@vendor_invoice.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/vendor_invoices/#{@another_vendor_invoice.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
