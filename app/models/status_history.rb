class StatusHistory < ApplicationRecord
  belongs_to :status_type
  belongs_to :appointment
end
