class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_user, only: [:new, :create]
  before_action :list_appointment_types, only: [:new, :create]

  def index
    @dates = Appointment.all.map{ |appointment| appointment.start_date.strftime("%F")}.uniq.sort
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      @appointment.end_date = @appointment.start_date+1.hours
      @appointment.save
      redirect_to root_path, notice: "Votre rdv a bien été pris en compte"
    else
      render :new
    end
  end

  def my_appointments
    @appointments = Appointment.all.where("user_id = ?", current_user.id).order(:start_date)
  end

private
  def appointment_params
    params.require(:appointment).permit(
        :start_date,
        :end_date,
        :review,
        :rate,
        :user_id,
        :appointment_type_id)
  end

  def find_user
    @user = current_user
  end

  def list_appointment_types
    @appointment_types = AppointmentType.all.where(bookable: true)
  end

end
