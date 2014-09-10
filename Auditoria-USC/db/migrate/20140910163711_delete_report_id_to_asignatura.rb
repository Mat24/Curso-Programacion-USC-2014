class DeleteReportIdToAsignatura < ActiveRecord::Migration
  def change
    remove_column :asignaturas, :reporte_id
  end
end
