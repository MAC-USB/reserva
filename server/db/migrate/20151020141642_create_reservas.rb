class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.string :sala_nombre, index: true
      t.references :materia, index: true, foreign_key: true
      t.boolean :video_beam
      t.text :software

      t.timestamps null: false
    end

    add_foreign_key :reservas, :salas, column: :sala_nombre, primary_key: :nombre
  end
end
