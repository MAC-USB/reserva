class AddReservaRefToHorarios < ActiveRecord::Migration
  def change
    add_reference :horarios, :reserva, index: true, foreign_key: true
  end
end
