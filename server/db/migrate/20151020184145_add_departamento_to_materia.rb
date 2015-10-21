class AddDepartamentoToMateria < ActiveRecord::Migration
  def change
    add_reference :materias, :departamento, index: true, foreign_key: true
  end
end
