class AppointmentsController < ApplicationController
  before_action :set_doctor, only: [:create]

  def index
    @user = current_user
    @appointments = @user.appointments_as_patient.all.to_a
  end

  def create
    # date = params[:appointment_date] | We need to get the DD/MM/YYYY from User's controller
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = current_user
    @appointment.doctor = @doctor
    # End time will be defined by calculating the start_time + procedure.duration
    # The Location can't be the first by default, it needs to be the specific one
    @appointment.location = @doctor.locations.first
    procedure_name = params[:procedure]
    procedure_duration = Procedure.find_by(name: procedure_name).duration
    year = params[:date].to_date.year
    month = params[:date].to_date.month
    day = params[:date].to_date.day
    hour = params[:appointment][:start_time]
    minute = 0.to_s
    @appointment.start_time = Time.new(year, month, day, hour, minute, 0, 0)
    @appointment.end_time = Time.new(year, month, day, hour, minute, 0, 0) + (procedure_duration * 60)
    if @appointment.save
      redirect_to appointments_path
    else
      redirect_to user_path(@doctor), status: :unprocessable_entity
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def destroy
  @appointment = Appointment.find(params[:id])
  @appointment.destroy
  redirect_to appointments_path, status: :see_other
  end

  private

  def set_doctor
    @doctor = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:symptoms, :start_time, :additional_details)
  end
end
