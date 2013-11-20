class Colour < ActiveRecord::Base
  attr_accessible :name

  belongs_to :boot

  validates :name, :presence => true
end
