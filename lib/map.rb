i = 0
def evey_other
    if rand(0..10).odd?
        return "+"
    end
    
    " "
end

empty_map_grid = Array.new(7) { Array.new(4, "") }
## Gen map

## Items: House, tree, large rock, grass, one single castle, treasure chest

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
