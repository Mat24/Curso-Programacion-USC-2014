class Reporte < ActiveRecord::Base
  belongs_to :docente
  belongs_to :asignatura
end
