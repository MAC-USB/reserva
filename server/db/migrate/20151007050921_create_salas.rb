class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :name
      t.integer :capacidad
      t.text :ubicacion
      t.string :responsable
      t.boolean :windows
      t.boolean :linux
      t.boolean :video_beam
      t.timestamps null: false
    end
  end
end
