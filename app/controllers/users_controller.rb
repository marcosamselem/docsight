class UsersController < ApplicationController
  def index
    @doctors = User.where(role: "doctor")
  end

  def new
    @patient = User.new
  end

  def create
    @patient = User.new(params_user)
    @patient = User.find(params[:id])
    @patient.save!
    redirect_to users_path
  end

  def show
    @appointment = Appointment.new
    @date = params[:appointment_date]
    @doctor = User.find(params[:id])
    # raise
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :phone_number, :specialty)
  end
end
