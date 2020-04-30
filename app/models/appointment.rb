class Appointment < ApplicationRecord
  belongs_to :doctor, optional: true
  belongs_to :patient, optional: true
  belongs_to :city, optional: true
end
