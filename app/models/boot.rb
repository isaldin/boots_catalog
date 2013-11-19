class Boot < ActiveRecord::Base
  attr_accessible :colour_id, :name, :size, :sole_id, :insole_id

  validates :name, presence: true, uniqueness: true
  validates :colour_id, presence: true
  validates :size, presence: true, numericality: true

  belongs_to :colour
  belongs_to :surface
  belongs_to :sole
  belongs_to :insole
end
