class AddReporteIdToAsignatura < ActiveRecord::Migration
  def change
    add_column :asignaturas, :reporte_id, :integer
  end
end
