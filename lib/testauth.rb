
# uri = URI("#{database_url}#{path}.json?auth=#{secret}")

# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true

# request = Net::HTTP::Post.new(uri.request_uri)
# request.body = data.to_json

# response = http.request(request)

# puts response.body


require 'net/http'
require 'json'

# Constants for Firebase project
API_KEY = "AIzaSyCJ4WSGrvIPx4USZqSJARqB_rwT2hc5uQg"
AUTH_DOMAIN = "identitytoolkit.googleapis.com/v1"

# Sign up a new user
def sign_up(email, password)
  uri = URI("https://#{AUTH_DOMAIN}/accounts:signUp?key=#{API_KEY}")
  body = { email: email, password: password, returnSecureToken: true }.to_json
  headers = { 'Content-Type': 'application/json' }

  response = send_request(uri, :post, headers, body)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)
  else
    raise "Error signing up user: #{response.body}"
  end
end

# Sign in an existing user
def sign_in(email, password)
  uri = URI("https://#{AUTH_DOMAIN}/accounts:signInWithPassword?key=#{API_KEY}")
  body = { email: email, password: password, returnSecureToken: true }.to_json
  headers = { 'Content-Type': 'application/json' }

  response = send_request(uri, :post, headers, body)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)
  else
    raise "Error signing in user: #{response.body}"
  end
end

# Send an HTTP request
def send_request(uri, method, headers, body)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = case method
            when :post then Net::HTTP::Post.new(uri, headers)
            when :get then Net::HTTP::Get.new(uri, headers)
            end
  request.body = body
  http.request(request)
end  

# Sign up a new user
# user = sign_up("user@example.com", "password")
# puts "Signed up user with UID: #{user['localId']}"

# Sign in an existing user
session = sign_in("user@example.com", "password")
puts "Signed in user with UID: #{session['localId']} and ID token: #{session['idToken']}"


require 'net/http'
require 'json'

# Replace with your Firebase project's databaseURL
database_url = 'https://ruby-kingdom-default-rtdb.firebaseio.com/'

# Replace with your Firebase project's secret
secret = '<your-secret>'

# Replace with the path to the location in the database where you want to add data
path = '/data'

# Replace with the data you want to add
data = { 'email' => 'value' }

uri = URI("#{database_url}#{path}.json")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri.request_uri)
request.body = data.to_json

response = http.request(request)

puts response.body

property = '"email"'

uri = URI("#{database_url}#{path}.json?orderBy=#{property}&startAt=#{property}")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

data = JSON.parse(response.body)

puts data

