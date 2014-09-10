class Asignatura < ActiveRecord::Base
  belongs_to :docente
  has_many :reportes
end
