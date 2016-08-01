require_relative 'image'

puts images

images.each do |image|
  puts `docker pull localhost:5000/#{image}`
  puts `docker tag localhost:5000/#{image} #{image}`
end

clear_tmp_images
