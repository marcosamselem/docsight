class AppointmentsController < ApplicationController
  before_action :set_doctor, only: [:new, :create]

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = current_user
    @appointment.doctor = @doctor
    @appointment.location = @doctor.locations.first
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def set_doctor
    @doctor = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:symptoms, :start_time, :end_time)
  end

end
