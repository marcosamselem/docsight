class ProcedureDoctor < ApplicationRecord
  belongs_to :doctor
  belongs_to :procedure
end
