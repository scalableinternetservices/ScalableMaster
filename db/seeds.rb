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
                    intro: "3333",
                    avatar_file_name: "1.jpg")
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
                      img_url: "par_img_url#{x}.jpg",
                      avatar_file_name: "1.jpg")
end


10.times do |xx|
	x = xx + 1
	a = Activity.new(name: "act#{x}",
					 description: "description",
					 img_url: "act_img_url#{x}.jpg",
					 phone: "1111",
					 address: "2222",
					 scale: 10,
					 email: "service@example.com",
					 organizer_id: x,
					 city_name: "Los Angeles")
	a.save!	
end

# i = 1
# Dir.foreach('image_upload/act/') do |img|
# 	if i > 10
# 		break;
# 	end
# 	act = Activity.find(i)
# 	if (!File.directory? "image_upload/act/#{img}") && (img != ".DS_Store")
# 	    act.update_attribute(:avatar_file_name, img)
# 	    i+=1
# 	end
# end

i = 1
File.open('image_log/act.txt','r').each do |img|
	img = img.strip
	if i > 10
		break;
	end
	act = Activity.find(i)
	if (!File.directory? "image_upload/act/#{img}") && (img != "")
	    act.update_attribute(:avatar_file_name, img)
	    i+=1
	end
end

i = 1
File.open('image_log/org.txt','r').each do |img|
	img = img.strip
	if i > 10
		break;
	end
	org = Organizer.find(i)
	if (!File.directory? "image_upload/org/#{img}") && (img != "")
	    org.update_attribute(:avatar_file_name, img)
	    i+=1
	end
end

i = 1
File.open('image_log/par.txt','r').each do |img|
	img = img.strip
	if i > 10
		break;
	end
	par = Participant.find(i)
	if (!File.directory? "image_upload/par/#{img}") && (img != "")
	    par.update_attribute(:avatar_file_name, img)
	    i+=1
	end
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

p = Participant.all
p.each do |par|
	t = Random.rand(5) + 1
	t.times do |tt|
		tag_id = Random.rand(10) + 1
		par.tags << Tag.find(tag_id)
	end
end

a = Activity.all
a.each do |act|
	t = Random.rand(5) + 1
	t.times do |tt|
		tag_id = Random.rand(10) + 1
		act.tags << Tag.find(tag_id)
	end
end

o = Organizer.all
o.each do |org|
	t = Random.rand(5) + 1
	t.times do |tt|
		tag_id = Random.rand(10) + 1
		org.tags << Tag.find(tag_id)
	end
end

idea = Idea.all
idea.each do |ide|
	t = Random.rand(5) + 1
	t.times do |tt|
		tag_id = Random.rand(10) + 1
		ide.tags << Tag.find(tag_id)
	end
end
