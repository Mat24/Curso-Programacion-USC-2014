class AddAsignaturaIdToReportes < ActiveRecord::Migration
  def change
    add_column :reportes, :asignatura_id, :integer
  end
end
