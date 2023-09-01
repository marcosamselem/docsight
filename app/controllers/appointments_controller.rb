class AppointmentsController < ApplicationController
  before_action :set_doctor, only: [:new, :create]


  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor = @doctor
    @appointment.location = @doctor.locations.first
    @appointment.patient = current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_doctor
    @doctor = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:symptoms, :start_date, :end_date)
  end
end
