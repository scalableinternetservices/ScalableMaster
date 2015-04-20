# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |x| 
  Organizer.create!(name: "org#{x}", email: "org#{x}@example.com", 
                    password: "asdfasdf", password_confirmation: "asdfasdf")
end


10.times do |x| 
  Participant.create!(name: "par#{x}", email: "par#{x}@example.com", 
                      password: "12341234", password_confirmation: "12341234")
end