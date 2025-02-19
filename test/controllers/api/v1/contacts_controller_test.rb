require "controllers/api/v1/test"

class Api::V1::ContactsControllerTest < Api::Test
    def setup
      # See `test/controllers/api/test.rb` for common set up for API tests.
      super

      @company = create(:company, team: @team)
@contact = build(:contact, company: @company)
      @other_contacts = create_list(:contact, 3)
      # 🚅 super scaffolding will insert file-related logic above this line.
      @contact.save

      @another_contact = create(:contact, company: @company)
    end

    # This assertion is written in such a way that new attributes won't cause the tests to start failing, but removing
    # data we were previously providing to users _will_ break the test suite.
    def assert_proper_object_serialization(contact_data)
      # Fetch the contact in question and prepare to compare it's attributes.
      contact = Contact.find(contact_data["id"])

      assert_equal_or_nil contact_data['contact_type'], contact.contact_type
      assert_equal_or_nil contact_data['first_name'], contact.first_name
      assert_equal_or_nil contact_data['last_name'], contact.last_name
      assert_equal_or_nil contact_data['title'], contact.title
      assert_equal_or_nil contact_data['email'], contact.email
      assert_equal_or_nil contact_data['fax_number'], contact.fax_number
      assert_equal_or_nil contact_data['cell_number'], contact.cell_number
      assert_equal_or_nil contact_data['work_number'], contact.work_number
      assert_equal_or_nil contact_data['social_link'], contact.social_link
      assert_equal_or_nil contact_data['cloudinary_image'], contact.cloudinary_image
      assert_equal_or_nil contact_data['company_role'], contact.company_role
      # 🚅 super scaffolding will insert new fields above this line.

      assert_equal contact_data["company_id"], contact.company_id
    end

    test "index" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/companies/#{@company.id}/contacts", params: {access_token: access_token}
      assert_response :success

      # Make sure it's returning our resources.
      contact_ids_returned = response.parsed_body.map { |contact| contact["id"] }
      assert_includes(contact_ids_returned, @contact.id)

      # But not returning other people's resources.
      assert_not_includes(contact_ids_returned, @other_contacts[0].id)

      # And that the object structure is correct.
      assert_proper_object_serialization response.parsed_body.first
    end

    test "show" do
      # Fetch and ensure nothing is seriously broken.
      get "/api/v1/contacts/#{@contact.id}", params: {access_token: access_token}
      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      get "/api/v1/contacts/#{@contact.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "create" do
      # Use the serializer to generate a payload, but strip some attributes out.
      params = {access_token: access_token}
      contact_data = JSON.parse(build(:contact, company: nil).to_api_json)
      contact_data.except!("id", "company_id", "created_at", "updated_at")
      params[:contact] = contact_data

      post "/api/v1/companies/#{@company.id}/contacts", params: params
      assert_response :success

      # # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # Also ensure we can't do that same action as another user.
      post "/api/v1/companies/#{@company.id}/contacts",
        params: params.merge({access_token: another_access_token})
      assert_response :not_found
    end

    test "update" do
      # Post an attribute update ensure nothing is seriously broken.
      put "/api/v1/contacts/#{@contact.id}", params: {
        access_token: access_token,
        contact: {
          first_name: 'Alternative String Value',
          last_name: 'Alternative String Value',
          title: 'Alternative String Value',
          email: 'another.email@test.com',
          fax_number: '+19053871234',
          cell_number: '+19053871234',
          work_number: '+19053871234',
          social_link: 'Alternative String Value',
          company_role: 'Alternative String Value',
          # 🚅 super scaffolding will also insert new fields above this line.
        }
      }

      assert_response :success

      # Ensure all the required data is returned properly.
      assert_proper_object_serialization response.parsed_body

      # But we have to manually assert the value was properly updated.
      @contact.reload
      assert_equal @contact.first_name, 'Alternative String Value'
      assert_equal @contact.last_name, 'Alternative String Value'
      assert_equal @contact.title, 'Alternative String Value'
      assert_equal @contact.email, 'another.email@test.com'
      assert_equal @contact.fax_number, '+19053871234'
      assert_equal @contact.cell_number, '+19053871234'
      assert_equal @contact.work_number, '+19053871234'
      assert_equal @contact.social_link, 'Alternative String Value'
      assert_equal @contact.company_role, 'Alternative String Value'
      # 🚅 super scaffolding will additionally insert new fields above this line.

      # Also ensure we can't do that same action as another user.
      put "/api/v1/contacts/#{@contact.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end

    test "destroy" do
      # Delete and ensure it actually went away.
      assert_difference("Contact.count", -1) do
        delete "/api/v1/contacts/#{@contact.id}", params: {access_token: access_token}
        assert_response :success
      end

      # Also ensure we can't do that same action as another user.
      delete "/api/v1/contacts/#{@another_contact.id}", params: {access_token: another_access_token}
      assert_response :not_found
    end
end
