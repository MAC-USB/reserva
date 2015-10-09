class FixSalasName < ActiveRecord::Migration
  def change
    rename_column :salas, :name, :nombre
  end
end
