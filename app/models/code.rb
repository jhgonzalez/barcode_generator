class Code < ActiveRecord::Base
  include ActiveModel::Validations
  validates_presence_of :part_no, :start, :finish
  attr_accessor :part_no, :start, :finish
end