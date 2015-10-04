class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :nombre
      t.string :version
      t.string :link
      t.string :sala

      t.timestamps null: false
    end
  end
end
