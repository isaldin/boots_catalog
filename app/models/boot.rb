class Boot < ActiveRecord::Base
  attr_accessible :name, :size, :colour_id#, :sole_id, :insole_id, :surface_id

  validates :name, presence: true, uniqueness: true
  validates :colour_id, presence: true
  #validates :sole_id, presence: true
  #validates :insole_id, presence: true
  #validates :surface_id, presence: true
  validates :size, presence: true, numericality: true

  def colour
    Colour.find(self.colour_id)
  end
end
