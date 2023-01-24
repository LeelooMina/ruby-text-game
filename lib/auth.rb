require "./lib/slow_text.rb"
require "./lib/text_response.rb"
require "./lib/intro.rb"
require 'net/http'
require 'json'

module Auth
  @@characters = [
    {
      "name" => "test",
      "class" => "Warrior",
    },
  ]

  @API_KEY = "AIzaSyCJ4WSGrvIPx4USZqSJARqB_rwT2hc5uQg"
@AUTH_DOMAIN = "identitytoolkit.googleapis.com/v1"

  @text_response = TextResponse.new

  @@class_choice = ""
  @@name = ""

  ## Create character instance & add attributes

  def self.create_character
    $current_character = Character.new

    $current_character.set_name(@@name)
    $current_character.set_class(@@class_choice)
  end

  def self.intro_skip
    puts "What will your character's name be?"
    @@name = gets.chomp
    class_selection
    create_character
    puts "Wanna sign up for an account?"
      puts "Y/N"
      input = gets.chomp.downcase
      if input == "y"
        sign_up


      end
    Intro::run_game
  end

  def self.send_request(uri, method, headers, body)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = case method
              when :post then Net::HTTP::Post.new(uri, headers)
              when :get then Net::HTTP::Get.new(uri, headers)
              end
    request.body = body
    http.request(request)
  end  

  
  def self.login
    puts "Enter your email address:"
    print "> ".green
    email_input = gets.chomp

    puts "Enter your password:"
    print "> ".green
    password_input = gets.chomp

    auth_process(email_input, password_input)


  end


  def self.auth_process(email, password)
    uri = URI("https://#{@AUTH_DOMAIN}/accounts:signInWithPassword?key=#{@API_KEY}")
  body = { email: email, password: password, returnSecureToken: true }.to_json
  headers = { 'Content-Type': 'application/json' }

  response = send_request(uri, :post, headers, body)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)
  else
    raise "Error signing in user: #{response.body}"

  end


#fetch_character(email)

  end


  def fetch_character(email)



    ## name, class, hp, inventory, gold, level, exp_points, location

    name = @@characters[0]["name"]
    $current_character = Character.new
    $current_character.set_name(name)
    $current_character.set_class(@@characters[0]["class"])
    "You are __ , a thing in Ruby Kingdom"

  end


  def save_character(email)


    Menu::run($current_character.location)
  end

  def self.sign_up
    uri = URI("https://#{@AUTH_DOMAIN}/accounts:signUp?key=#{@API_KEY}")
    
    puts "Enter your email to sign up:"
    email = gets.chomp
    puts "Enter your new password:"
    password = gets.chomp

  body = { email: email, password: password, returnSecureToken: true }.to_json
  headers = { 'Content-Type': 'application/json' }

  response = send_request(uri, :post, headers, body)

  if response.is_a?(Net::HTTPSuccess)
    puts "Sign up sucessful!"
    JSON.parse(response.body)
    
  else
    raise "Error signing up user: #{response.body}"
  end
    # @@characters
  end



























  
  def self.class_selection
    character_class_check = false

    while character_class_check != true
      slow_text do
        <<-'CLASS_TEXT'
    
    Pick a class:
        1. Warrior
        2. Mage
        3. Programmer
    
    CLASS_TEXT
      end

      print "> ".green
      class_input = gets.chomp
      puts

      sleep 2

      ## Checks the user input to see if it matches an existing character class

      if Character::CHARACTER_CLASSES.include?(class_input.downcase.capitalize())
        slow_text do
          @text_response.word_input
        end
        character_class_check = true

        case class_input.downcase.capitalize()
        when Character::CHARACTER_CLASSES[0]
          slow_text(0.03) do
            @text_response.warrior_selection
          end
        when Character::CHARACTER_CLASSES[1]
          slow_text do
            @text_response.mage_selection
          end
        when Character::CHARACTER_CLASSES[2]
          slow_text(0.03) do
            @text_response.programmer_selection
          end
          slow_text(0.03) do
            @text_response.programmer_selection_2
          end
        end

        class_input = class_input.downcase.capitalize()
      elsif class_input.to_i >= 4
        slow_text(0.07) do
          "Can you count to 3?"
        end
        character_class_check = false
      elsif class_input.to_i == 1
        slow_text(0.03) do
          @text_response.number_input
        end
        sleep 1
        slow_text(0.03) do
          @text_response.warrior_selection
        end
        class_input = Character::CHARACTER_CLASSES[0]
        character_class_check = true
      elsif class_input.to_i == 2
        slow_text(0.03) do
          @text_response.number_input
        end
        slow_text(0.03) do
          @text_response.mage_selection
        end
        sleep 1
        class_input = Character::CHARACTER_CLASSES[1]
        character_class_check = true
      elsif class_input.to_i == 3
        slow_text(0.03) do
          @text_response.number_input
        end
        sleep 1
        slow_text(0.03) do
          @text_response.programmer_selection
        end

        slow_text(0.03) do
          @text_response.programmer_selection_2
        end
        class_input = Character::CHARACTER_CLASSES[2]
        character_class_check = true
      else
        slow_text(0.03) do
          @text_response.mistake_1.red
        end

        slow_text(0.03) do
          @text_response.mistake_2.yellow
        end
        character_class_check = false
      end

      @@class_choice = class_input
      puts
      sleep 1
    end
  end

  def self.character_intro
    ## character Creation
    slow_text do
      "Wanna skip the intro?"
    end
    puts "Y/N"
    print "> ".green
    skip_check = gets.chomp.downcase
    if skip_check == "y"
      intro_skip
    else
      slow_text(0.03) do
        "What will your name be?"
      end
      print "> ".green
      character_name = gets.chomp
      puts

      sleep 2

      puts "Oh.".yellow.bold
      puts
      sleep 1
      puts "#{character_name}?".red.bold.italic
      puts
      sleep 1
      puts "Really?".red.bold.italic
      puts
      sleep 1
      slow_text(0.1) do
        "Well...Okay.".green.bold
      end

      puts
      sleep 1
      slow_text(0.03) do
        "Hope you're happy. You can't change it now."
      end

      sleep 3

      @@name = character_name

      class_selection

      create_character

      ## Joke text

      random_name = RandomName.random_name
      random_class = RandomName.random_class

      puts
      slow_text(0.03) do
        "You are #{random_name}, a #{random_class} in Ruby Kingdom!".green
      end

      sleep 1
      puts

      slow_text do
        "Wait..".yellow
      end
      puts

      sleep 2

      slow_text(0.1) do
        "What did you do??".red.bold.italic
      end

      sleep 1

      slow_text(0.1) do
        "You broke it!".red.bold.italic
      end

      sleep 2
      puts

      slow_text(0.1) do
        "Now I have to go fix it.".yellow
      end

      sleep 3
      puts
      slow_text(0.1) do
        "......"
      end

      sleep 1
      puts
      puts

      slow_text(0.03) do
        "You are #{$current_character.get_name}, a #{$current_character.get_class} in Ruby Kingdom!".green
      end

      puts

      slow_text(0.1) do
        "Okay. It's working. Don't touch anything else.".cyan.bold
      end

      puts "Wanna sign up for an account?"
      puts "Y/N"
      input = gets.chomp.downcase
      if input == "y"
        sign_up


      end


    end
  end
end


