class Map
  def initialize
    @house = "H"
    @tree = "T"
    @large_rock = "R"
    @ruby_castle = "C"
  end


    ## Creates an arry to represent a 3x3 grid
    ## map[rows][columns]
    ## Rows 0, 2, 4, 6 - Even numbers are the corners of the map's grid
    ## Rows 1, 3, 5 - Odd numbers have space for landmarks/ character placement
    ## Columns 0, 1, 2 have space for landmarks/location
    ## Column 4 is the last column of map corners
    ##
    ## Example: Adding character location to center -  map[3][1]
    # +  +  +  + 
 
    # +  +  +  + 
    #     X  
    # +  +  +  + 
   
    # +  +  +  + 

    

  empty_map_grid = Array.new(7) { Array.new(4, "") }
  ## Gen map

def get_landmark

end
 

  ## Enter house

  ## Enter castle

  ## Print Map

  empty_map_grid.each_with_index do |row, i|
    row.each_with_index do |column, y|
      if i.even?
        print "  +"
      elsif i == 3 && y == 1
        space_counter = 0
        while space_counter < y
          print "   "
          space_counter += 1
        end
        print "   X "
      end
    end

    puts " "
  end
end
