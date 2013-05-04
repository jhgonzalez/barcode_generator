class Area < ActiveRecord::Base
  attr_accessible :color, :name
  has_many :cards
end
