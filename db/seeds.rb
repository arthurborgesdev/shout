# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "arthurborges", full_name: "Arthur Borges")
u2 = User.create(username: "dedafranca", full_name: "Andressa Borges")
u3 = User.create(username: "cleidestela", full_name: "Cleide Borges")

y1 = u1.yells.create(text: "HELLLPPP!!!")
y2 = u2.yells.create(text: "SOMEONE SOS")
y3 = u3.yells.create(text: "SAVE MEEE!")