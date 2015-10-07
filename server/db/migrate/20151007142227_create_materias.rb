class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :codigo
      t.string :nombre
      t.string :departamento

      t.timestamps null: false
    end
  end
end
