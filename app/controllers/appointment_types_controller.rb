class AppointmentTypesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @appointment_types = AppointmentType.all
  end
end
