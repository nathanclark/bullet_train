import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
    static targets = [ "id" ]
    static values = {
        company: String
    }
    connect(){}
    remove_address(e){
        console.log('test23')
        e.preventDefault()

    }
    async getPostalAddressPartial(){
        const response = await get(`/account/teams/${this.companyValue}/companies/postal_address_field`, {responseKind:'turbo-stream'})

    }
}