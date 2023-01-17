i = 0
def evey_other
    if rand(0..10).odd?
        return "+"
    end
    
    " "
end

empty_map_grid = Array.new(7) { Array.new(4, " +") }
## Gen map

## Items: House, tree, large rock, grass, one single castle, treasure chest

## Enter house

## Enter castle

##

empty_map_grid.each_with_index do |row, i|
  row.each do |cell|
    if i.even?
    print " #{cell} "
    elsif i.odd?
        print " "
    end
   
  end

  puts " "
end
