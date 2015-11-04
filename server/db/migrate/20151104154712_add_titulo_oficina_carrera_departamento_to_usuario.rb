class AddTituloOficinaCarreraDepartamentoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :titulo, :string
    add_column :usuarios, :oficina, :string
    add_column :usuarios, :carrera, :string
    add_reference :usuarios, :departamento, index: true, foreign_key: true
  end
end
