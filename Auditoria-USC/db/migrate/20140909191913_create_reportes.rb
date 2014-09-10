class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.integer :numero_estudiantes
      t.integer :docente_id
      t.text :comentario

      t.timestamps
    end
  end
end
