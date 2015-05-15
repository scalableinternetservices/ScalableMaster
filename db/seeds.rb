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

descriptions = 
[
	"The nuns were hurt and confused when the Vatican accused them a few months earlier of straying from Catholic teaching and promoting “radical feminist themes incompatible with the Catholic faith.” And for many Catholics, the appointment of Archbishop Sartain and two other bishops amounted to a hostile takeover.",
	"That image was glaring to the Republican strategists who blocked him from moderating a debate last year in the Senate race in Iowa.",
	"With the war on terror seemingly a forever war, demands for openness clash with the advantages of secrecy, as shown in the debate over the National Security Agency.",
	"Hironimus and the boy's father, Dennis Nebus, have been warring since her pregnancy. They were never married but share custody of their child, and in a parenting agreement filed in court, the two agreed to the boy's circumcision. The mother later changed her mind, though, giving way to a long legal battle. Circuit and appellate judges have sided with the father, but potential surgeons have backed out after failing to get the mother's consent and being targeted by anti-circumcision protesters.",
	"The Trainorders.com webmaster said in an email on Thursday, “Our privacy policy prevents us from sharing the identity of any member of the web site.” On Wednesday, other members of the site identified the handle bwb6df as belonging to Mr. Bostian and to the driver of the Philadelphia train; the webmaster deleted those posts, but they were viewable in an Internet cache.",
	"Amtrak said on Thursday that limited service between Philadelphia and New York could resume on Monday, with full service by Tuesday. In the meantime, the suspension is disrupting one of the busiest transportation corridors in the nation.",
	" for $2,309. But a ticket on the noon shuttle cost $554.",
	"But Trebor Banstetter, a spokesman for Delta, said that the airline “has not increased fares on the New York to Washington, D.C., and Boston shuttle service.",
	"So the businessman bought a plane ticket."
]
titles = 
[
	"Hi",
	"Hello",
	"Aloha!",
	"What?",
	"Come on!",
	"Hehe",
	"Let's go",
	"Funny",
	"0_0"
]
10.times do |xx|
  x = xx + 1
  tmp = Random.rand(9)
  Idea.create!(title: titles[tmp],
               description: descriptions[tmp],
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
