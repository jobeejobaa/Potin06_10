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
    zip_code: "#{rand(1000..9999)}"
  )
end

puts " 👥 Creating users..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Fantasy::Tolkien.poem,
    email: "#{Faker::Internet.unique.username}@gmail.com",
    age: rand(12..30),
    city: City.all.sample,
    active_user: false
  )
end

puts " 🕺 Creating active user..."
User.create!(
  first_name: Faker::Name.first_name,
  last_name:  Faker::Name.last_name,
  description: Faker::Fantasy::Tolkien.poem,
  email: "#{Faker::Internet.unique.username}@gmail.com",
  age: rand(12..30),
  city: City.all.sample,
  active_user: true
)

puts " 📰 Creating gossips..."
20.times do
  Gossip.create!(
    title: Faker::Book.title.truncate(14),
    content: Faker::Fantasy::Tolkien.poem,
    user: User.all.sample,
    city: City.all.sample
  )
end

puts " 🔗 Creating tags..."
10.times do
  Tag.create!(
    title: Faker::Fantasy::Tolkien.race
  )
end

puts " ⛓️ Creating comments..."
20.times do
  Comment.create!(
    content: Faker::Fantasy::Tolkien.poem,
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end

puts " 🫀 Creating likes..."
20.times do
  Like.create!(
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end

puts " ✍️ Creating gossip_tags..."
10.times do
  GossipTag.create!(
    gossip: Gossip.all.sample,
    tag: Tag.all.sample
  )
end

puts " ✅ Done!"
puts "Users: #{User.count} | Cities: #{City.count} | Gossips: #{Gossip.count} | Tags: #{Tag.count} | Comments: #{Comment.count} | Likes: #{Like.count} | GossipTags: #{GossipTag.count}"
