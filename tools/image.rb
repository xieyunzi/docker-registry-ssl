require 'json'

def images(registry_address)
  repositories = JSON.parse(`curl -sSL #{registry_address}/v2/_catalog`)['repositories']

  _images = []
  repositories.each do |repository|
    repository_tags = JSON.parse(`curl -sSL #{registry_address}/v2/#{repository}/tags/list`)

    repository_tags['tags'].each do |tag|
      _images << "#{repository}:#{tag}"
    end
  end

  _images
end

def clear_tmp_images(registry_address)
  _images = `docker images`.split("\n").map { |l| (l.split)[0..1].join(":") }.select { |l| l.start_with?(registry_address) }

  _images.each do |image|
    puts `docker rmi #{image}`
  end
end
