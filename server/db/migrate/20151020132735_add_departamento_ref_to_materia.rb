class AddDepartamentoRefToMateria < ActiveRecord::Migration
  def change
  	remove_column :materias, :departamento
    add_reference :materias, :departamento, index: true, foreign_key: true
  end
end
