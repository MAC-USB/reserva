class AddSalaRefToSoftware < ActiveRecord::Migration
  def change
    remove_column :softwares, :sala
    add_reference :softwares, :sala, index: true, foreign_key: true
  end
end
