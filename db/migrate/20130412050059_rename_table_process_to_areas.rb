class RenameTableProcessToAreas < ActiveRecord::Migration
  def change
    rename_table :process, :areas
  end
end
