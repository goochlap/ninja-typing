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
Category.destroy_all


puts "creating categories..."

category_1 =  { name: "weapon"}
category_2 =  { name: "ribbon"}
category_3 =  { name: "badge"}

[ category_1, category_2, category_3].each do |attributes|
  category = Category.create!(attributes)
  puts "Created #{category.name}"
end

puts "Creating items..."
weapon_1 = { name: "fit sword", price: "10", image: "/image/weapon1.png", category: Category.find_by(category_1) }
weapon_2 =  { name: "blood sword", price: "20", image: "/image/weapon2.png", category: Category.find_by(category_1) }
weapon_3 =  { name: "golden sword", price: "30", image: "/image/weaponfire2.png", category: Category.find_by(category_1) }
weapon_4 =  { name: "ice sword", price: "50", image: "/image/weaponice.png", category: Category.find_by(category_1) }
ribbon_1 = { name: "black ribbon", price: "10", image: "/image/ribbonblack.png", category: Category.find_by(category_2) }
ribbon_2 = { name: "green ribbon", price: "20", image: "/image/ribbongreen.png", category: Category.find_by(category_2) }
ribbon_3 = { name: "blue ribbon", price: "30", image: "/image/ribbonblue.png", category: Category.find_by(category_2) }
ribbon_4 = { name: "red ribbon", price: "40", image: "/image/ribbonred.png", category: Category.find_by(category_2) }
ribbon_5 = { name: "gold ribbon", price: "100", image: "/image/ribbongold.png", category: Category.find_by(category_2) }
badge_1 = { name: "green lantern", price: "10", image: "/image/badgegreen.png", category: Category.find_by(category_3) }
badge_2 = { name: "ocean ninja", price: "20", image: "/image/badgeblue.png", category: Category.find_by(category_3) }
badge_3 = { name: "death match", price: "30", image: "/image/badgered.png", category: Category.find_by(category_3) }
badge_4 = { name: "god of gold", price: "50", image: "/image/badgegold.png", category: Category.find_by(category_3) }


[ weapon_1, weapon_2, weapon_3, weapon_4, ribbon_1, ribbon_2, ribbon_3, ribbon_4, ribbon_5, badge_1, badge_2, badge_3, badge_4 ].each do |attributes|
  item = Item.create!(attributes)
  puts "Created #{item.name}"
end


puts "Finished!"

