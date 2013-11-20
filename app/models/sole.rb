class Sole < ActiveRecord::Base
  attr_accessible :name

  has_many :boots, :dependent => :destroy

  validates :name, :presence => true
end
