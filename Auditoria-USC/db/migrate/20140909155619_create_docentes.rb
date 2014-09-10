class CreateDocentes < ActiveRecord::Migration
  def change
    create_table :docentes do |t|
      t.string :nombre
      t.integer :identificacion

      t.timestamps
    end
  end
end
