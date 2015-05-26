image_path = '/media/psf/Dropbox/image_upload/'

# i = 1
# Dir.foreach("#{image_path}act/") do |img|
# 	if i > 10
# 		break;
# 	end
# 	act = Activity.find(i)
# 	if (!File.directory? "#{image_path}act/#{img}") && (img != ".DS_Store")
# 	    act.update_attribute(:avatar, File.open("#{image_path}act/#{img}", 'r'))
# 	    i+=1
# 	end
# end
# puts "act done"

i = 1
while i < 200
	img_name = ["1.jpg","10.jpg", "2.jpg", "3.jpg", "4.jpg", "6.jpg", "7.jpg", "IMG_5411.jpg", "IMG_6056.jpg", "IMG_6169.jpg"]
	act = Activity.find(i)
	if (!File.directory? "#{image_path}act/#{img_name[(i - 1)%10]}") 
	    act.update_attribute(:avatar, File.open("#{image_path}act/#{img_name[(i - 1)%10]}", 'r'))
	    i+=1
	end
end
puts "act done"

i = 1
Dir.foreach("#{image_path}org_thumbnail/") do |img|
	if i > 10
		break;
	end
	act = Organizer.find(i)
	if (!File.directory? "#{image_path}org_thumbnail/#{img}") && (img != ".DS_Store")
	    act.update_attribute(:avatar, File.open("#{image_path}org_thumbnail/#{img}", 'r'))
	    i+=1
	end
end
puts "org done"

i = 1
Dir.foreach("#{image_path}par_thumbnail/") do |img|
	if i > 10
		break;
	end
	act = Participant.find(i)
	if (!File.directory? "#{image_path}par_thumbnail/#{img}") && (img != ".DS_Store")
	    act.update_attribute(:avatar, File.open("#{image_path}par_thumbnail/#{img}", 'r'))
	    i+=1
	end
end
puts "par done"