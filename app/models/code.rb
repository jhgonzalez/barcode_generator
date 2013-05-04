class Code < ActiveRecord::Base
  attr_accessor :part_no, :start, :finish
  include ActiveModel::Validations
  validates_presence_of :part_no, :start, :finish
  # validate :part_no, :presence => true
  
end