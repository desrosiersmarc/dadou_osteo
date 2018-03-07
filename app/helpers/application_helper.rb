module ApplicationHelper

  def appointments_per_date(date_to_check)
    Appointment.all.where("start_date > ?", date_to_check.to_datetime)
                    .where("start_date < ?", date_to_check.to_datetime+23.hours+59.minutes)
  end

end
