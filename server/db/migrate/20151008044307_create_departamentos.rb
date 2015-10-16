class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.string :telefono
      t.string :correo
      t.string :pcontacto

      t.timestamps null: false
    end
  end
end
