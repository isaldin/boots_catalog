class Colour < ActiveRecord::Base
  attr_accessible :name

  belongs_to :boot
end
