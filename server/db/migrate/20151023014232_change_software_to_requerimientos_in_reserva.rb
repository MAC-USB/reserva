class ChangeSoftwareToRequerimientosInReserva < ActiveRecord::Migration
  def change
    rename_column :reservas, :software, :requerimientos
  end
end
