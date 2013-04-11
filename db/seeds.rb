# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ps3 = Console.create name: 'PlayStation 3'
xbox = Console.create name: 'Xbox 360'
wii = Console.create name: 'Wii'

fight = Category.create name: "Luta"
action = Category.create name: "Acao"
shooter = Category.create name: "Tiro"
sport = Category.create name: "Esporte"
puzzle = Category.create name: "Puzzle"
adventure = Category.create name: "Aventura"
