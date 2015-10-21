class AddCodigoToDepartamento < ActiveRecord::Migration
  def change
    add_column :departamentos, :codigo, :string
  end
end
