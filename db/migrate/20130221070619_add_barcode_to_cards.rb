class AddBarcodeToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.string :barcode
    end
  end
end
