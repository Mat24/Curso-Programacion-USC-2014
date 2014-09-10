class CreateAsignaturas < ActiveRecord::Migration
  def change
    create_table :asignaturas do |t|
      t.string :nombre
      t.string :codigo
      t.text :descripcion
      t.integer :docente_id

      t.timestamps
    end
  end
end
