class ProceduresAppointment < ApplicationRecord
  belongs_to :appointment
  belongs_to :procedure
end
