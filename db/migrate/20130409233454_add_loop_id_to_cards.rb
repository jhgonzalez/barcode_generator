class AddLoopIdToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :loop_id
    end
  end
end
