class RemovePcontactoFromDepartamentos < ActiveRecord::Migration
  def change
    remove_column :departamentos, :pcontacto, :string
  end
end
