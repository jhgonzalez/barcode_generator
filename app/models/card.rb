class Card < ActiveRecord::Base
  attr_accessible :bin_qty, :barcode, :description, :from_loc, :part_no, :to_loc, :start, :finish
  validates :bin_qty, :description, :from_loc, :part_no, :to_loc, :start, :finish, :presence => true
  #Calls the before_save method to concatenate required fields for barcode creation
  before_save :barcode
      
  #Concatenates required fields to create barcode
  def barcode
    self.barcode = "#{self.part_no}" + "-" + "#{self.start}" + "-" + "#{self.finish}"
  end
  
end
