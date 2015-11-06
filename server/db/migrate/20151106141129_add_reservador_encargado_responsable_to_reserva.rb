class AddReservadorEncargadoResponsableToReserva < ActiveRecord::Migration
  def change
    add_reference :reservas, :reservador, foreign_key: true, index: true
    add_reference :reservas, :encargado, foreign_key: true, index: true
    add_reference :reservas, :responsable, foreign_key: true, index: true
  end
end
