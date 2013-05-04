class RenameTableLoopsToProcess < ActiveRecord::Migration
  def change
    rename_table :loops, :process
  end
end
