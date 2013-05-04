class AddCindexToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.string :card_index
    end
  end
end
