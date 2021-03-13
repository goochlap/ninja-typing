# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Avatar.destroy_all
# Board.destroy_all

puts "Cleaning database..."
User.destroy_all
AvatarItem.destroy_all
Item.destroy_all

puts "Creating items..."
weapon_1 = { name: "sword", price: "30", image: "/image/weapon2.png" }
weapon_2 =  { name: "silver sword", price: "50", image: "/image/weapon3.png" }
weapon_3 =  { name: "golden sword", price: "70", image: "/image/weapon4.png" }
weapon_4 =  { name: "rock sword", price: "100", image: "/image/weapon5.png" }


[ weapon_1, weapon_2, weapon_3, weapon_4 ].each do |attributes|
  item = Item.create!(attributes)
  puts "Created #{item.name}"
end
puts "Finished!"

