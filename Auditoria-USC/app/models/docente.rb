class Docente < ActiveRecord::Base
  has_many :asignaturas
  has_many :reportes
end
