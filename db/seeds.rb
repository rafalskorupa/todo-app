# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



15.times do |i|
  user = User.create!(password: "12345678", password_confirmation: "12345678", name: Faker::Superhero.name, email: "#{i}@mail.com")

  Random.rand(3).times do |j|
    list = user.lists.create!(name: "#{Faker::Superhero.name}'s #{j} list")
    Random.rand(15).times do
      list.tasks.create(name: "learn #{Faker::Superhero.power}", active: (Random.rand(5)>2 ? true : false))
    end
  end

end
