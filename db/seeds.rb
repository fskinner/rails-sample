# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ps3 = Console.create! name: 'PlayStation 3'
xbox = Console.create! name: 'Xbox 360'
wii = Console.create! name: 'Wii'

fight = Gender.create! name: "Luta"
action = Gender.create! name: "Acao"
shooter = Gender.create! name: "Tiro"
sport = Gender.create! name: "Esporte"
puzzle = Gender.create! name: "Puzzle"
adventure = Gender.create! name: "Aventura"

price1 = PriceRange.create! category: "Lancamento", price: "150.0", increment_value: "4"
price2 = PriceRange.create! category: "Atuais", price: "120.0", increment_value: "3"
price3 = PriceRange.create! category: "Antigos", price: "90.0", increment_value: "2"

Game.create name: "Street Fighter", console: ps3, gender: fight, available: false, price_range: price2
Game.create name: "Street Fighter", console: xbox, gender: fight, available: true, price_range: price2

Game.create name: "Fifa 13", console: xbox, gender: sport, available: true, price_range: price1
Game.create name: "PES 13", console: ps3, gender: sport, available: true, price_range: price1
Game.create name: "WiiSports", console: wii, gender: sport, available: true, price_range: price1

Game.create name: "God of War", console: ps3, gender: action, available: true, price_range: price3
Game.create name: "Alan Wake", console: xbox, gender: action, available: false, price_range: price3
Game.create name: "Wiininja", console: wii, gender: action, available: true, price_range: price3

Game.create name: "Uncharted", console: ps3, gender: shooter, available: true, price_range: price2
Game.create name: "Gears of War", console: xbox, gender: shooter, available: true, price_range: price1
Game.create name: "Wii Shooter", console: wii, gender: shooter, available: false, price_range: price3