class RemoveDepartamentoFromUsuario < ActiveRecord::Migration
  def change
    remove_reference :usuarios, :departamento, index: true, foreign_key: true
  end
end
