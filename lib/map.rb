require "./lib/location.rb"

class Map
  def initialize
    @house = "    H "
    @tree = "   T "
    @large_rock = "   R "
    @ruby_castle = "   C "

    @house_amt = 1
    @castle_amt = 1
    @tree_amt = 2
    @rock_amt = 2

    @map_grid = Array.new(7) { Array.new(4, "") }
    @map_cords = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @character_location = 9

    @locations = {
      "1" => Location.new,
      "2" => Location.new,
      "3" => Location.new,
      "4" => Location.new,
      "5" => Location.new,
      "6" => Location.new,
      "7" => Location.new,
      "8" => Location.new,
      "9" => Location.new,
    }
  end

  ## Assigns chracter location as if the grid is
  ## laid out in a 1-9 format
  ## Example:
  # +  +  +  +
  #  1  2   3
  # +  +  +  +
  #  4  5  6
  # +  +  +  +
  #  7  8  9
  # +  +  +  +

  def return_to_menu
    run_location(@character_location)
  end

  def set_character_location(locaton)
    @character_location = locaton
    case @character_location
    when 1
      clear_location
      @map_grid[1][1] = "  X "
      @locations["1"].roll_enemy
      print_map
      run_location(1)
    when 2
      clear_location
      @map_grid[1][2] = "  X "
      @locations["2"].roll_enemy
      print_map
      run_location(2)
    when 3
      clear_location
      @map_grid[1][4] = "  X "
      @locations["3"].roll_enemy
      print_map
      run_location(3)
    when 4
      clear_location
      @map_grid[3][1] = "  X "
      @locations["4"].roll_enemy
      print_map
      run_location(4)
    when 5
      clear_location
      @map_grid[3][2] = "  X "
      @locations["5"].roll_enemy
      print_map
      run_location(5)
    when 6
      clear_location
      @map_grid[3][4] = "  X "
      @locations["6"].roll_enemy
      print_map
      run_location(6)
    when 7
      clear_location
      @map_grid[5][1] = "  X "
      @locations["7"].roll_enemy
      print_map
      run_location(7)
    when 8
      clear_location
      @map_grid[5][2] = "  X "
      @locations["8"].roll_enemy
      print_map
      run_location(8)
    when 9
      clear_location
      @map_grid[5][4] = "  X "
      @locations["9"].roll_enemy
      print_map
      run_location(9)
    else
      puts "You can't go that way."
      move
    end
  end

  def move
    print_map
    puts
    puts "Which direction do you want to move?"
    print "> ".green
    direction = gets.chomp.downcase
    case direction
    when "north", "n", "up", "forward", "f", "u"
      set_character_location(@character_location - 3)
    when "south", "s", "down", "back", "backwards", "d"
      set_character_location(@character_location + 3)
    when "west", "w", "left", "l"
      set_character_location(@character_location - 1)
    when "east", "e", "right", "r"
      set_character_location(@character_location + 1)
    when "help"
      puts "Try typing a direction, such as 'North' or 'N'.".yellow.italic
      move
    else
      move
    end
  end

  def run_location(cord)
    @locations["#{cord}"].run
  end

  def clear_location
    @map_grid.each_with_index do |row, i|
      row.each_with_index do |column, y|
        if column != "" && row != ""
          @map_grid[i][y] = ""
        end
      end
    end
  end

  ## map is represented by an arry that represents a 3x3 grid
  ## map_grid[rows][columns]
  ## Rows 0, 2, 4, 6 - Even numbers are the corners of the map's grid
  ## Rows 1, 3, 5 - Odd numbers have space for landmarks/ character placement
  ## Columns 1, 2, 4 have space for landmarks/location
  ##
  ## Example: Adding character location to center -  map_grid[3][2]
  # +  +  +  +

  # +  +  +  +
  #     X
  # +  +  +  +

  # +  +  +  +

  def print_map
    @map_grid.each_with_index do |row, i|
      row.each_with_index do |column, y|
        if i.even?
          print "  +"
        elsif column != "" && row != ""
          space_counter = 0
          while space_counter < y
            print "  "
            space_counter += 1
          end
          print @map_grid[i][y]
        end
      end

      ## Spacing between rows

      puts " "
    end
  end
end

# def generate_map

#     @map_grid[1][0] = @house
#     @map_grid[5][4] = @ruby_castle
#     # @map_grid.each_with_index do |row, i|
#     #     row.each_with_index do |column, y|
#     #       if i.odd? && i != 7
#     #         @map_grid[i][y] = landmark_counters
#     #       end
#     #     end
#     # end
#     # puts @map_grid
# end

# def set_landmarks
#     rand_num = rand(0..100)

#     if rand_num.even?
#         return landmark_counters
#     end

# end

# def landmark_counters
#     case
#     when  @castle_amt != 0
#         @castle_amt -= 1
#         @castle
#     when @house_amt != 0
#         @house_amt -= 1
#         @house
#     when    @tree_amt != 0
#         @tree_amt -= 1
#         @tree
#     when    @rock_amt != 0
#         @rock_amt -= 1
#         @rock
#     end
# end

# def get_landmark

# end
