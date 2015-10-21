class AddIndexToSoftware < ActiveRecord::Migration
  def change
    add_index :softwares, :sala_nombre
  end
end
