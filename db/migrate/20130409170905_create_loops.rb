class CreateLoops < ActiveRecord::Migration
  def change
    create_table :loops do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
