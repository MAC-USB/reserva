class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.text :contenido
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
