import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
    static targets = [ "id" ]
    static values = {
        company: String
    }
    connect(){}

    async getPostalAddressPartial(){
        const response = await get(`/account/teams/${this.companyValue}/companies/postal_address_field`, {responseKind:'turbo-stream'})

    }
}