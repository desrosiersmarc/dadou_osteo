class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dates = Appointment.all.map{ |appointment| appointment.start_date.strftime("%F")}.uniq.sort
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @appointment_types = AppointmentType.all.where(bookable: true)
    @user = current_user
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path, notice: "Votre rdv a bien été pris en compte"
    else
      render :new
    end
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

end
