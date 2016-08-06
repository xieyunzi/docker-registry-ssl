require_relative 'image'

registry_address = ENV['REGISTRY_ADDRESS'] ? ENV['REGISTRY_ADDRESS'] : 'localhost:5000'

puts images(registry_address)

images(registry_address).each do |image|
  puts `docker pull #{registry_address}/#{image}`
  puts `docker tag #{registry_address}/#{image} #{image}`
end

clear_tmp_images(registry_address)
