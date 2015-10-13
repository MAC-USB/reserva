class ChangeRefToSalaFromSoftware < ActiveRecord::Migration
  def change
    remove_column :softwares, :sala_id
    add_column :softwares, :sala_nombre, :string, index: true
    add_foreign_key :softwares, :salas, column: :sala_nombre, primary_key: :nombre
  end
end
