require_relative 'image'

registry_address = ENV['REGISTRY_ADDRESS'] ? ENV['REGISTRY_ADDRESS'] : 'localhost:5000'

images = `docker images`.split("\n").map { |l| (l.split)[0..1].join(":") }.reject do |l|
  l.start_with?(registry_address) || l.start_with?("REPOSITORY:TAG")
end

images.each do |image|
  puts `docker tag #{image} #{registry_address}/#{image}`
  puts `docker push #{registry_address}/#{image}`
end

clear_tmp_images(registry_address)
