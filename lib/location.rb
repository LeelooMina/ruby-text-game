require './lib/menu.rb'

class Location
    @@location_counter = 0
    @@shop_location = 7
    @@castle_location = 3
    
    def initialize
        @@location_counter += 1
        @description = "You see nothing. A wasteland."
        Menu.

        init_location
        run
    end


    def run 
        puts
        puts @description
        check_loot
        check_enemy

        # check for enemy
        # pull landmarks
        #print discription

    end

    def init_location
        if @@location_counter == @@castle_location
            set_castle
        elsif @@location_counter == @@shop_location
            set_shop
        else

        end
           
    end

    def roll_for_castle

    end

    def roll_for_shop
         
    end

    def set_castle

    end

    def set_shop

    end

    def check_enemy

    end

    def check_loot

    end
end
