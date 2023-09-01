import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr" // to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["calendar"]
  connect() {
    console.log(this.element);
    flatpickr(this.element, {
      inline: true
    })
  }

}
