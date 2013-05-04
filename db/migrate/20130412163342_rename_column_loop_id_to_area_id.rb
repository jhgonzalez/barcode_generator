class RenameColumnLoopIdToAreaId < ActiveRecord::Migration
  def change
    rename_column :cards, :loop_id, :area_id
  end
end
