class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dates = Appointment.all.map{ |appointment| appointment.start_date.strftime("%F")}.uniq.sort
    @appointments = Appointment.all
  end

end
