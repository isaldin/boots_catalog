class Boot < ActiveRecord::Base
  attr_accessible :colour_id, :name, :size

  validates :name, presence: true, uniqueness: true
  validates :colour_id, presence: true
  validates :size, presence: true, numericality: true

  def colour
    Colour.find(self.colour_id)
  end
end
