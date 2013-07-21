ps3 = Console.create! name: 'PlayStation 3'
xbox = Console.create! name: 'Xbox 360'
wii = Console.create! name: 'Wii'

fight = Gender.create! name: "Luta"
action = Gender.create! name: "Acao"
shooter = Gender.create! name: "Tiro"
sport = Gender.create! name: "Esporte"
puzzle = Gender.create! name: "Puzzle"
adventure = Gender.create! name: "Aventura"

price1 = PriceRange.create! category: "Lancamentos", price: "150.0", decrement_value: "4"
price2 = PriceRange.create! category: "Atuais", price: "120.0", decrement_value: "3"
price3 = PriceRange.create! category: "Antigos", price: "90.0", decrement_value: "2"

game1 = Game.create name: "Street Fighter", console: xbox, gender: fight, price_range: price2
game2 = Game.create name: "Fifa 13", console: xbox, gender: sport, price_range: price1
game3 = Game.create name: "PES 13", console: ps3, gender: sport, price_range: price1
game4 = Game.create name: "WiiSports", console: wii, gender: sport, price_range: price1
game5 = Game.create name: "God of War", console: ps3, gender: action, price_range: price3
game6 = Game.create name: "Alan Wake", console: xbox, gender: action, price_range: price3
game7 = Game.create name: "Wiininja", console: wii, gender: action, price_range: price3
game8 = Game.create name: "Uncharted", console: ps3, gender: shooter, price_range: price2
game9 = Game.create name: "Gears of War", console: xbox, gender: shooter, price_range: price1

GameSample.create available: true, game: game1
GameSample.create available: true, game: game1

GameSample.create available: true, game: game2

GameSample.create available: true, game: game3

GameSample.create available: true, game: game4

GameSample.create available: true, game: game5
GameSample.create available: true, game: game5
GameSample.create available: true, game: game5

GameSample.create available: true, game: game7

GameSample.create available: true, game: game8
GameSample.create available: true, game: game8

GameSample.create available: true, game: game9

User.create name: "Admin", email: "admin@admin.com", password: "123123", street: "admin", city: "admin", state: "admin", zipcode: "admin", role: "admin"