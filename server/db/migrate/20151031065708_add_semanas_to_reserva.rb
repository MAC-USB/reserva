class AddSemanasToReserva < ActiveRecord::Migration
  def change
  	add_column :reservas, :semanas_activas, :string
  end
end
