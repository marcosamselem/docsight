import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr" // to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["appointment_date"] // I want to capture the DD/MM/YYYY on the click
  connect() {
    console.log("Im connected");
    console.log(this.element);
    flatpickr(this.element, {
      inline: true
    })
  }


  // I want to send "appointment_date" to the Modal
  setDate() {
    console.log("Im inside SetDate in the Stimulus controller")
    console.log(this.appoinment_dateTargetValue)
  }
}
