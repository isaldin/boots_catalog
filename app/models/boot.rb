class Boot < ActiveRecord::Base
  attr_accessible :name, :size, :colour_id, :surface_id, :sole_id, :insole_id

  belongs_to :colour
  belongs_to :sole
  belongs_to :insole
  belongs_to :surface

  validates :name, presence: true, uniqueness: true
  validates :colour, presence: true
  validates :surface, presence: true
  validates :sole, presence: true
  validates :insole, presence: true
  validates :size, presence: true, numericality: true
end
