# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#{rand(1000..2000)}#{rand(65..70).chr}



PrivateMessage.destroy_all
puts " Creating private messages..."
20.times do
  PrivateMessage.create!(
    content: Faker::Lorem,
    user_id: rand((User.all.first.id)..(User.all.last.id))
  )
end
