class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :part_no
      t.string :description
      t.string :from_loc
      t.string :to_loc
      t.integer :bin_qty

      t.timestamps
    end
  end
end
