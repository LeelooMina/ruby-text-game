require './lib/menu.rb'
require './lib/text_style.rb'

class Location
    @@location_counter = 0
    @@shop_location = 7
    @@castle_location = 3
    @@location_descriptions = {
        "mountain" => "You find yourself standing at the base of a towering mountain. The rough, rocky terrain stretches up before you, leading to a jagged peak that disappears into the clouds above. The air is thin and crisp, and the sound of the wind whipping through the crags and crevices of the mountain is the only thing you can hear.",
        "lake" => "As you continue on your journey, you find yourself walking along the shores of a serence lake. The calm water reflects the blue sky above you. You watch as a family of ducks slide into the water as your grow near.",
        "grasslands" => "Tall grass stretches out before you, as far as you can see. The sound of small birds chirping and insects buzzing about fills the air around your.",
        "tarpit" => "Ahead of you lies a vast tar pit. The ground feels like syrup that grabs at your feet as you walk. The sent of decay fills the air. The only trees that survive here are blacked and twisted.",
        "forest" => "The trail you're following winds into a dense forest. The trees here are tall and ancient, their branches only let in small streams of sunlight. The air smells thick with the scent of recent rain. You hear small creatues scurrying away as you approach.",
        "ruins" => "Just up head you spot some sort of structures. A town? As you near, you realize it hasn't been occupied for centries. The old stone buildings are covered with vines, their walls crumbling. Nature is busy at work, taking back the land.",
        "desert" => "In front of you there is only one thing - sand. It sparkles in the intense sunlight. Wind whips through the dunes, picking up sand. You squint your eyes as you try to continue.",
        "graveyard" => "A graveyard stretches out before you, rows of weathered headstones stand as silent monuments to the passage of time. You feel uneasy. The ground below your feet is loose and uneven. The air feels damp and smells of mold. ",
        "stream" => "A bubbling stream winds its way through the area ahead. The water is so clear that you can see small schools of minnows swimming about. You feel a refreshing breeze.",
        "wasteland" => "The sky above you suddenly darkens. Shadows grow and the wind howls. The land is filled with the bones of animals that were unfortunate enough to come here. Nothing survives in this place for long. Best to move along quickly.",
        "castle" => "An ancient castle stands before you. The grey stone walls are tall and formidable. A deep and digusting moat surrounds it. The wooden drawbridge is open, as if to invite you inside.",
        "shop" => "The air is filled with the chatter of people going about their daily business. Just up ahead is a busy town square. Local merchants have set up shop to peddle their wares.Chickens cluck from metal cages, vegetables lay in woven baskets, but what catches your eye is the local blacksmith. You step up to the stall to take a look at their offerings."

    }

    attr_accessor :loot_check, :enemy_check, :shop_check, :shop, :castle
    
    def initialize
        @@location_counter += 1
        @shop = false
        @castle = false
        @description = "You are nowhere. Good luck!"
        roll_for_castle
        roll_for_shop
        @enemy_check = enemy?
        @loot_check = loot?
        @shop_check = shop?
        @castle_check = castle?
        

        init_location
       
    end

    def run
        puts
        if @castle == true
            puts <<-'BIG_TEXT'
                                |--__
                                |
                                X
                       |-___   / \       |--__
                       |      =====      |
                       X      | .:|      X
                      / \     | O |     / \
                     =====   |:  . |   =====
                     |.: |__| .   : |__| :.|
                     |  :|. :  ...   : |.  |
                     | .    .  ||| .      :|
                

                BIG_TEXT
        end
        puts @description
        if @enemy_check == true && @shop ==  false
            puts "There is an enemy here".red
        end
        puts
        # check_loot
        # check_enemy
        Menu.run(self)
        # check for enemy
        # pull landmarks
        #print discription

    end

    def init_location
        if @@location_counter == 3
            set_castle
        elsif @@location_counter == 4
            set_shop
        else
            set_land
        end
           
    end

    def roll_for_castle
        rand_num = rand(1..9)
        while rand_num == 5
            rand_num = rand(1..9)
        end

        @@castle_location = rand_num
        

    end

    def roll_for_shop
        rand_num = rand(1..9)
        while rand_num == 5
            rand_num = rand(1..9)
        end
        @@shop_location = rand_num
    end

    def set_castle
        @description = @@location_descriptions["castle"]
        @castle = true

    end

    def set_shop
        @description = @@location_descriptions["shop"]
        @shop = true
        @enemy_check = false
    end

    def set_land
        rand_land = rand(1..10)
        land_type = ""
        case rand_land
        when 1
            land_type = "mountain"
            @description = @@location_descriptions["#{land_type}"]
        when 2
            land_type = "lake"
            @description = @@location_descriptions["#{land_type}"]
        when 3
            land_type = "grasslands"
            @description = @@location_descriptions["#{land_type}"]
        when 4
            land_type = "tarpit"
            @description = @@location_descriptions["#{land_type}"]
        when 5
            land_type = "forest"
            @description = @@location_descriptions["#{land_type}"]
        when 6
            land_type = "ruins"
            @description = @@location_descriptions["#{land_type}"]
        when 7
            land_type = "desert"
            @description = @@location_descriptions["#{land_type}"]
        when 8
            land_type = "graveyard"
            @description = @@location_descriptions["#{land_type}"]
        when 9
            land_type = "stream"
            @description = @@location_descriptions["#{land_type}"]
        when 10
            land_type = "wasteland"
            @description = @@location_descriptions["#{land_type}"]
        end
        
       
    end

    def roll_enemy
        @enemy_check = enemy?
    end

    def set_enemy(check)
        @enemy_check = check
    end


    def enemy?
        random_number = rand(0..10)
        if random_number.odd?
            true
        else
            false
        end
    end

    def loot?
        random_number = rand(0..10)
        if random_number.even?
            true
        else
            false
        end

    end

    def shop?
        if @shop == true
            true
        else
            false
        end
    end

    def castle?
        if @castle == true
            true
        else
            false
        end
    end
end

