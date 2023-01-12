require "json"

require "net/http"

require "uri"

def get_rand_pokemon_name
  pokemon_num = rand(1..151)

  url = "https://pokeapi.co/api/v2/pokemon-form/#{pokemon_num}"

  uri = URI.parse(url)
  req = Net::HTTP::Get.new(uri.request_uri)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  res = https.request(req)
  JSON.parse(res.body)["pokemon"]["name"].capitalize
end
