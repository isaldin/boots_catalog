class Boot < ActiveRecord::Base
  attr_accessible :name, :size, :colour_id, :surface_id, :sole_id, :insole_id

  validates :name, presence: true, uniqueness: true
  validates :colour_id, presence: true
  validates :surface_id, presence: true
  validates :sole_id, presence: true
  validates :insole_id, presence: true
  validates :size, presence: true, numericality: true

  def colour
    Colour.find(self.colour_id)
  end

  def surface
    Surface.find(self.surface_id)
  end

  def sole
    Sole.find(self.sole_id)
  end

  def insole
    Insole.find(self.insole_id)
  end
end
