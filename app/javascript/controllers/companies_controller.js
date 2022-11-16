import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
    connect(){}

    async getPostalAddressPartial(){
        const response = await get("/companies/postal_address_field")
        if (response.ok){
            console.log('test')
        }
    }
}