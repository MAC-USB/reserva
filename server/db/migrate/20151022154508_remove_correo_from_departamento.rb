class RemoveCorreoFromDepartamento < ActiveRecord::Migration
  def change
    remove_column :departamentos, :correo, :string
  end
end
