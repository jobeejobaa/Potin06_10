# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts " 🧹 Cleaning DB..."

GossipTag.destroy_all
Like.destroy_all
Comment.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

puts " 🧱 Creating cities..."
10.times do
  City.create!(
    city_name: Faker::Address.city,
    zip_code: "#{rand(1000..2000)}#{rand(65..70).chr}"
  )
end

puts " 👥 Creating users..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Lorem,
    email: "#{(Faker.name).split.join}@gmail.com",
    age: rand(12..30),
    city_id: rand((City.all.first.id)..(City.all.last.id))
  )
end

puts " 📰 Creating gossips..."
20.times do
  Gossip.create!(
    title: Faker::Book.name,
    content: Faker::Lorem,
    user_id: rand((User.all.first.id)..(User.all.last.id))
  )
end

puts " 🔗 Creating tags..."
10.times do
  Tag.create!(
    title: Faker::Lorem
  )
end

puts " ⛓️  Creating comments..."
20.times do
  Comment.create!(
    content: Faker::Lorem,
    user_id: rand((User.all.first.id)..(User.all.last.id)),
    gossip_id: rand((Gossip.all.first.id)..(Gossip.all.last.id))
  )
end

puts " 🫀  Creating likes..."
20.times do
  Like.create!(
    user_id: rand((User.all.first.id)..(User.all.last.id)),
    gossip_id: rand((Gossip.all.first.id)..(Gossip.all.last.id))
  )
end

puts " ✍️  Creating gossips & tags..."
10.times do 
  GossipTag.create!(
    gossip_id: rand((Gossip.all.first.id)..(Gossip.all.last.id)),
    tag_id: rand((Tag.all.first.id)..(Tag.all.last.id))
  )
end

puts " ✅ Done !"
puts "Users: #{User.count} | Cities: #{City.count} | Gossips: #{Gossip.count} | Tags: #{Tag.count} | Comments: #{Comment.count} | Likes: #{Like.count} | Gossips & Tags: #{GossipTag.count}"

