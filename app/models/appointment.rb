class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment_type

  validates :appointment_type_id, presence: true
end
