class UsersController < ApplicationController
  def index
    @doctors = User.where(role: "doctor")
  end
  
  def show
    @user = User.find(params[:id])
  end
end
