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

    @empty_map_grid = Array.new(7) { Array.new(4, "")}
  end

    ## generate_map
    ## map is represented by an arry that represents a 3x3 grid
    ## map[rows][columns]
    ## Rows 0, 2, 4, 6 - Even numbers are the corners of the map's grid
    ## Rows 1, 3, 5 - Odd numbers have space for landmarks/ character placement
    ## Row 7 is the bottom row of corners
    ## Columns 0, 1, 3 have space for landmarks/location
    ## Column 2 is left empty for spacing reasons
    ## Column 4 is the last column of map corners
    ##
    ## Example: Adding character location to center -  map[3][1]
    # +  +  +  + 
 
    # +  +  +  + 
    #     X  
    # +  +  +  + 
   
    # +  +  +  + 

# def generate_map

#     @empty_map_grid[1][0] = @house
#     @empty_map_grid[5][4] = @ruby_castle
#     # @empty_map_grid.each_with_index do |row, i|
#     #     row.each_with_index do |column, y|
#     #       if i.odd? && i != 7
#     #         @empty_map_grid[i][y] = landmark_counters
#     #       end
#     #     end
#     # end
#     # puts @empty_map_grid
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

def print_map
     
  @empty_map_grid.each_with_index do |row, i|
    row.each_with_index do |column, y|
      if i.even?
        print "  +"
      elsif column != "" && row != ""
        if column != "" && row != ""
            space_counter = 0
            while space_counter < y
              print "  "
              space_counter += 1
            end
            print @empty_map_grid[i][y]
        end
        # print "   X "
      end
    end

    puts " "
  end
end

## Spacing 

def set_character_location(x, y)
    @empty_map_grid[x][y] = "  X "
end
end
  ## Enter house

  ## Enter castle

  ## Print Map

  map = Map.new
#   map.generate_map
  map.set_character_location(5, 4)

  map.print_map



