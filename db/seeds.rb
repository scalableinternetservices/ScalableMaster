# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |xx| 
	x = xx + 1
  Organizer.create!(name: "org#{x}", 
  									email: "org#{x}@example.com", 
                    password: "12345678", 
                    password_confirmation: "12345678",
                    nickname: "org_nickname#{x}",
                    gender: 1,
                    age: 1,
                    phone: "1111",
                    address: "2222",
                    img_url: "org_img_url#{x}.jpg",
                    intro: "3333")
end


10.times do |xx| 
	x = xx + 1
  Participant.create!(name: "par#{x}", 
  					  				email: "par#{x}@example.com", 
                      password: "12345678", 
                      password_confirmation: "12345678",
                      nickname: "par_nickname#{x}",
                      gender: 1,
                      age: 1,
                      phone: "1111",
                      address: "2222",
                      img_url: "par_img_url#{x}.jpg")
end


10.times do |xx|
	x = xx + 1
	Activity.create!(name: "act#{x}",
					 description: "description",
					 img_url: "act_img_url#{x}.jpg",
					 phone: "1111",
					 address: "2222",
					 scale: 10,
					 email: "service@example.com",
					 organizer_id: x,
					 city_name: "Los Angeles")
end

10.times do |xx|
	x = xx + 1
	Idea.create!(title: "idea#{x}",
		 					 description: "idea description",
		 					 participant_id: x)
end

10.times do |xx|
	x = xx + 1
	Tag.create!(name: "tag#{x}")
end

10.times do |xx|
	x = xx + 1
	a = Activity.find(x)
	5.times do |yy|
		y = yy + 1
		p = Participant.find(y)
		a.participants << p
	end
end

