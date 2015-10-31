class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.integer :dia
      t.text :hora_inicio
      t.text :hora_fin
      t.timestamps null: false
    end
  end
end
