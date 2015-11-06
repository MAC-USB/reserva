class ChangeResponsableToRefInSala < ActiveRecord::Migration
  def change
    change_column :salas, :responsable, :integer
    add_foreign_key :salas, :usuarios, column: :responsable, primary_key: :id
    add_index :salas, :responsable
  end
end
