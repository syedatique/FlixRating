# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
c1 = Category.create!(decade_name: "1960s")
c2 = Category.create!(decade_name: "1970s")
c3 = Category.create!(decade_name: "1980s")
c4 = Category.create!(decade_name: "1990s")
c5 = Category.create!(decade_name: "2000s")