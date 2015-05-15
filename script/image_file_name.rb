image_path = '/media/psf/Dropbox/image_upload/'

f = File.open("image_log/act.txt", "w+")
Dir.foreach("#{image_path}act") do |img|
	# byebug
	if (!File.directory? "#{image_path}act/#{img}") && (img != ".DS_Store")
	    f.puts(img)
	end
end
f.close

f = File.open("image_log/org.txt", "w+")
Dir.foreach("#{image_path}org_thumbnail") do |img|
	# byebug
	if (!File.directory? "#{image_path}org_thumbnail/#{img}") && (img != ".DS_Store")
	    f.puts(img)
	end
end
f.close

f = File.open("image_log/par.txt", "w+")
Dir.foreach("#{image_path}par_thumbnail") do |img|
	# byebug
	if (!File.directory? "#{image_path}par_thumbnail/#{img}") && (img != ".DS_Store")
	    f.puts(img)
	end
end
f.close