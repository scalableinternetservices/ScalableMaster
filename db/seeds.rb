# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org_names = 
[
	"Qiangdong Liu",
	"Kai-Fu Lee",
	"Jack Ma",
	"Steve Jobs",
	"Bill Gates",
	"Elon Musk",
	"Robin Li",
	"Mark Zuckerberg",
	"Jeff Bezos",
	"Larry Page"
]
10.times do |xx| 
  x = xx + 1
  Organizer.create!(name: org_names[xx], 
                    email: "org#{x}@example.com", 
                    password: "12345678", 
                    password_confirmation: "12345678",
                    nickname: "org_nickname#{x}",
                    gender: 1,
                    age: 1,
                    phone: "342-973-4903",
                    address: "534 Wall Street, New York City, NY, 43250",
                    img_url: "org_img_url#{x}.jpg",
                    intro: "3333",
                    avatar_file_name: "1.jpg")
end

par_names = 
[
	"Daniel Wu",
	"Jay Chou",
	"Tom Cruise",
	"Chris Evans",
	"Scarlett Johansson",
	"Nai Cha",
	"Hugh Jackman",
	"Robert Downey Jr.",
	"Johnny Depp",
	"David Beckham"
]
10.times do |xx| 
  x = xx + 1
  Participant.create!(name: par_names[xx], 
                      email: "par#{x}@example.com", 
                      password: "12345678", 
                      password_confirmation: "12345678",
                      nickname: "par_nickname#{x}",
                      gender: 1,
                      age: 1,
                      phone: "324-893-0342",
                      address: "223 1st Avenue, New York City, NY, 44392",
                      img_url: "par_img_url#{x}.jpg",
                      avatar_file_name: "1.jpg")
end

act_names = 
[
	"CHALK IT UP WITH LA CRAFT COLLECTIVE",
	"Conference of the Christ 2015 Events",
	"IMSTA FESTA - Master Classes",
	"Biggest monthly small business conference in LA courtesy of PIFlabs",
	"CNSI (UCLA) Entrepreneurship Forum - Kite Pharma",
	"Delta Days in Orange County (CA): Effective Strategies for Community & Law Enforcement Engagement & Interactions",
	"Ink-N-Iron Festival",
	"Punk Rock Picnic",
	"Round Robin Cocktail Class & Tasting Thursdays",
	"Individual Classes & Series"
]
act_descriptions =
[
	'This event is part of Yes Address Los Angeles, Eventbrite"s 7-day event series showcasing LA"s best local businesses, event organizers, makers, and more. When you say "Yes" to new experiences, you open up a world of possibilities. Follow along on Instagram and Twitter to keep up with #YESLA. You never know where "Yes" will take you.',
	"Your Christ Consciousness will eventually bring you into a position where you can enter into awareness of your true self, into your own movement of spiritual inner awareness. It will bring you to the point at which you become the Messiah, the promised one. You become the alpha and the omega, from everlasting to everlasting - because you already are. - John-Roger, D.S.S. ",
	"IMSTA FESTA is an exciting one-day music technology event in Los Angeles. This celebration of music technology offers a great opportunity for music-makers to learn, network as well as meet with experts and product specialists from the most coveted music technology manufacturers in the world. IMSTA FESTA Master Classes is a series of classes with Steinberg, Arturia, AVID, Celemony, Soundtoys, PreSonus, Native Instruments, etc. These classes give music-makers the exclusive opportunity to have an intimate session with the product specialist; enabling the user to be well-versed and most efficient when using that particular tool in their music prouction. Be one of the 30 students in a Master Class and sign-up now for this FREE opportunity. Admission is FREE and open to anyone interested in the art of music making; DJ’s, musicians, songwriters, music producers, audio engineers, students and educators.",
	"Our May Start up conference is better again.  Expect a thousand people to turn up on the 18th of April at the Victorian and enjoy the best start up networking and business growth in town.  More of everything we always give you and just some of it is listed below.",
	"Kite Pharma, founded in 2009, is an immunotherapy company focussed on the development of engineered autologous T-cell therapy for hematological and solid tumors.  Kite Pharma is focused on the development and commercialization of novel cancer immunotherapy products designed to harness the power of a patient’s own immune system to eradicate cancer cells. Kite Pharma's goal is to be a leader in immunotherapy in multiple cancer indications. To achieve this, they are developing a pipeline of product candidates for the treatment of advanced solid and hematological malignancies using their therapeutic platform – engineered Autologous Cell Therapy (eACT™) – in which a patient’s own T cells, or white blood cells, are engineered to recognize and destroy their cancer.  ",
	"During this historic year, in which we waited more than five months for the confirmation of Loretta Lynch as the first African-American Attorney General of the United States, and where the importance of political awareness and activism is at an all-time high, it is with great pleasure that we invite the community at large to our first ever Delta Days in Orange County in collaboration with the Delta Research and Educational Foundation. The event will be held Saturday, May 30th and will bring together the Orange County community at large with our national, state and local leaders to discuss effective strategies for community and law enforcement engagement and interactions, as well as emphasize the importance of community activism in the political process.",
	"People are here for the love of live music, living art, hot rods-kustoms, burlesque, art shows, fashion, and of course the World Renowned Tattoo Convention. 280 of the best tattoo artists in the world will be on hand from 25 States and 25 Countries representing all the tattoo styles; where a car show and music become an integral part of the event, mingling with the artistic expressions of the artists at work. Pinups clad in corsets, Classic Cats with Pompadours, Mohawks, fashion Mullets, full sleeves and back pieces. Not only is the breathtaking view of Long Beach and the Queen Mary quite a task to take in all at once, but all the fashion statements and lavishly adorned people are quite a spectacle as well. This convention will be both a sort of art gallery and community festival. Twelve years ago the Queen Mary was overtaken at the first Ink-N-Iron in Long Beach, CA by the underground subculture of all things Kustom and modified. From tattooing to pin striping and tantalizing show goers with tight corsets, the 13th Annual Ink-N-Iron Festival in Long Beach is laced up and bracing for The Ride of a Lifetime!!",
	"The Punk Rock Picnic is and always has been old school. 60 bands on 6 stages for 1 day of explosive high energy punk rock featuring live music, skate demos, food, beer and much more. This is an all ages event and kids under 12 are only $25.00. Infants are free. So bring the whole family.",
	"ROUND ROBIN COCKTAIL CLASS THURSDAYS 9PM - 10PM Learn 4 cocktails from 4 different Continental Club bartenders",
	"Meal and a Spiel offers intimate hands on cooking experience for all levels that will provide you with very do-able access to exquisite and healthy cooking. Classes are limited to 10 people. We stand for high quality ingredients. All produce is organic when possible and all chicken/meats are hormone and antibiotic free, grass fed when possible. You will learn more than technique, you will learn how to “feel the cooking” so you can use the recipes as a jumping board for your own creations."
]
10.times do |xx|
	x = xx + 1
	tmp = Random.rand(9)
	a = Activity.new(name: act_names[tmp],
					 description: act_descriptions[tmp],
					 img_url: "act_img_url#{x}.jpg",
					 phone: "432-887-0938",
					 address: "138 Kelton Avenue, Los Angeles, CA 90024",
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
  tmp1 = Random.rand(9)
  star = Random.rand(100)
  Idea.create!(title: titles[tmp],
               description: descriptions[tmp1],
               participant_id: x,
               stars: star)
end

tags = 
[
	"Music",
	"Food",
	"Science",
	"Fiction",
	"Traveling",
	"Movie",
	"Hiking",
	"Party",
	"Skating",
	"Surfing"
]
10.times do |xx|
  x = xx + 1
  Tag.create!(name: tags[xx])
end

10.times do |xx|
  x = xx + 1
  a = Activity.find(x)
  y_set = []
  Random.rand(6).times do |yy|
    y = Random.rand(10) + 1
    if !y_set.include? y
    	y_set << y
    	p = Participant.find(y)
    	a.participants << p
    end
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
