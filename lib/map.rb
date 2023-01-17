class Map
  def initialize
    @house = "H"
    @tree = "T"
    @large_rock = "R"
    @ruby_castle = "C"
  end

  empty_map_grid = Array.new(7) { Array.new(4, "") }
  ## Gen map

  ## Items: House, tree, large rock, grass, one single castle, treasure chest

  house = "H"
  tree = "T"
  large_rock = "R"
  ruby_castle = "C"

  ## Enter house

  ## Enter castle

  ##

  empty_map_grid.each_with_index do |row, i|
    row.each_with_index do |cell, y|
      if i.even?
        print "  +"
      elsif y == 2 && i == 5
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
