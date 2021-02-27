# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
# Avatar.destroy_all
# Board.destroy_all

Game.create(name: 'Ninja VS Bogdanov Brothers')
Game.create(name: 'Zombies VS Ninjas')
Game.create(name: 'Les Ninjas VS les chtis à Ibiza')
Game.create(name: 'Au dessus des Ninjas...C le soleil !')

puts 'Job Finished'