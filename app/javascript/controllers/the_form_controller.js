import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="the-form"
export default class extends Controller {
  // static targets = ["date", "procedure", "modalDate", "modalProcedure", "modalDoctorAppointment"]
  // static values = {
  //   appointments: Array
  // }
  connect() {
    console.log("the form connected")
  }

  // send(e) {
  //   e.preventDefault()
  //   console.log("sending.......")
  //   console.log(this.dateTarget.value)
  //   console.log(this.procedureTarget.value)
  //   console.log(this.modalDateTarget)
  //   console.log(this.modalProcedureTarget)
  //   console.log(this.modalDoctorAppointmentTarget)
  //   console.dir(this.appointmentsValue)
  //   this.appointmentsValue.forEach((appt) => {
  //     console.log(Date.parse(appt.start_time))
  //     console.log(Date.parse(this.dateTarget.value))
  //   })

  //   const arrayAppt = [this.appointmentsValue]
  //   const dateAppointments = []
  //   arrayAppt.forEach((appt) => {
  //     if (Date.parse(appt.start_time) === Date.parse(this.dateTarget.value)) {
  //       dateAppointments.push(appt)
  //     }
  //   })
  //   console.log(dateAppointments)
  //   this.modalDateTarget.value = this.dateTarget.value
  //   this.modalProcedureTarget.value = this.procedureTarget.value

  // }
}
