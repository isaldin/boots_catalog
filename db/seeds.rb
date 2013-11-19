# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Boot.destroy_all
Colour.destroy_all
#Sole.destroy_all
#Insole.destroy_all
#Surface.destroy_all

#Sole.create!(:name => 'Paper')
#Insole.create!(:name => 'None')
#Surface.create!(:name => 'Leather')
Colour.create!(:name => 'Green')
Colour.create!(:name => 'Blue')
Colour.create!(:name => 'Red')