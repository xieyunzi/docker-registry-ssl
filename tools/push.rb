require_relative 'image'

images = `docker images`.split("\n").map { |l| (l.split)[0..1].join(":") }.reject { |l| l.start_with?("localhost:5000") || l.start_with?("REPOSITORY:TAG") }

images.each do |image|
  puts `docker tag #{image} localhost:5000/#{image}`
  puts `docker push localhost:5000/#{image}`
end

clear_tmp_images
