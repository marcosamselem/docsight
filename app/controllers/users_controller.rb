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
    @doctor = User.find(params[:id]) if User.where(role: "doctor")
    @doctor_appointments = User.find(@doctor.id).appointments_as_doctor
    # @doctor_appointments = JSON.parse(@doctor_appointments.map(&:attributes).to_json)
    # obj = {}
    # test = []
    # @doctor_appointments.each do |object|
    #   object.each do |k, v|
    #     obj[k] = v
    #   end
    #   test << obj
    # end
    # @doctor_appointments = test
    @date = params[:appointment_date].to_date if params[:appointment_date]
    @procedure = Procedure.find(params[:procedure_id]).name if params[:procedure_id]
    @real_procedure = Procedure.find(params[:procedure_id]) if params[:procedure_id]
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
        info_window_html: render_to_string(partial: "info_window", locals: {location: location}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def booking_appointment
    @doctor = User.find(params[:id])
    @doctor_appointments = User.find(@doctor.id).appointments_as_doctor
    @procedure = Procedure.find(params[:procedure_id]).name if params[:procedure_id]
    @real_procedure = Procedure.find(params[:procedure_id]) if params[:procedure_id]
    @date = params[:appointment_date].to_date if params[:appointment_date]
    if params[:appointment_date]
      @doctor_appointments = @doctor_appointments.select do |appointment|
        appointment.start_time.to_date == @date
      end
    end
    @appointment = Appointment.new
    @available_timings = (8..12).to_a + (14..17).to_a
    @unavailable_timings = []
    @doctor_appointments.each do |appt|
      @unavailable_timings << appt.start_time.hour
      @available_timings.delete(appt.start_time.hour)
      if appt.end_time.hour > appt.start_time.hour && appt.end_time.min.positive?
        @unavailable_timings << appt.end_time.hour
        @available_timings.delete(appt.end_time.hour)
      end
    end

    @available_timings.each_with_index do |hour, index|
      unless @available_timings[index + 2].nil?
        if @real_procedure.duration / 60.0 > 2 && @real_procedure.duration / 60.0 <= 3
          unless @available_timings[index + 1] - hour == 1 && @available_timings[index + 2] - @available_timings[index + 1] == 1
            @unavailable_timings << hour
          end
        end
      end
      unless @available_timings[index + 1].nil?
        if @real_procedure.duration / 60.0 > 1 && @real_procedure.duration / 60.0 <= 2
          unless @available_timings[index + 1] - hour == 1
            @unavailable_timings << hour
          end
        end
      end
    end
    @unavailable_timings.sort!.each { |time| @available_timings.delete(time) }
    # create an array of timeslots of one hour each
    # 8 to 13 and 14 to 18
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :phone_number, :specialty)
  end
end
