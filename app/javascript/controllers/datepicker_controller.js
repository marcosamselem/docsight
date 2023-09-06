import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr" // to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  // I want to capture the DD/MM/YYYY on the click
  connect() {
    console.log("Im connected");
    console.log(this.element);
    flatpickr(this.element, {
      inline: true
    })
  }

}
