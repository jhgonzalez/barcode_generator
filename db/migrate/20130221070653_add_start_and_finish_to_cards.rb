class AddStartAndFinishToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :start
      t.integer :finish
    end
  end
end
