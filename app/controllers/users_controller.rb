class UsersController < ApplicationController
  def index
    @doctors = User.where(role: "doctor")
    if params[:specialty].present?
      @doctors = User.search_by_specialty(params[:specialty])
    end
    if @doctors.empty?
      @doctors = User.where(role: "doctor")
    end
    @locations = Location.all
      @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { location: location }),
          marker_html: render_to_string(partial: "marker")
        }
    end
  end

  def new
    # To create the patient
    @patient = User.new
  end

  def create
    @patient = User.new(params_user)
    @patient = User.find(params[:id])
    @patient.save!
    redirect_to users_path
  end

  def show
    @doctors = User.where(role: "doctor")
    @doctor = User.find(params[:id])
    @doctor_appointments = User.find(@doctor.id).appointments_as_doctor
    @date = params[:appointment_date].to_date if params[:appointment_date]
    @procedure = Procedure.find(params[:procedure]).name if params[:procedure]
    @appointment = Appointment.new
    if params[:appointment_date]
      @doctor_appointments = @doctor_appointments.select do |appointment|
        appointment.start_time.to_date == @date
      end
    end
    @appointment = Appointment.new
# ------look for  an appointment for the current doctor being shown------
    @appointments_doc = Appointment.where(doctor_id: @doctor.id)
# ---------now  go through reviews looking for multiple appointments for that doctor---------
    @reviews = Review.where(appointment_id: @appointments_doc.ids)

    @markers = @doctor.locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {location: location})
      }
    end
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :phone_number, :specialty)
  end
end
