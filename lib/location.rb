require './lib/menu.rb'
require './lib/text_style.rb'

class Location
    @@location_counter = 0
    @@shop_location = 7
    @@castle_location = 3

    ## IMPORTANT! 
    ## These are intentionally out of the correct indentation for display formatting reasons.
    @@location_descriptions = {
        "mountain" => """
🏔️ You find yourself standing at the base of the Ruby Mountain, one of the kingdom's most treacherous peaks. 
The rough, rocky terrain stretches up before you, leading to a jagged peak where ruby crystals gleam in the sunlight. 
The air is thin and crisp, filled with magic. Ancient runes are carved into the mountainside, 
telling tales of brave adventurers who sought the Ruby Castle's secrets.""",
        "lake" => """
🏞️ As you continue on your journey, you find yourself walking along the shores of the Crystal Lake. 
The calm water reflects not just the blue sky, but shimmers with an otherworldly ruby glow. 
Local legends say this lake was blessed by the Ruby Heart itself. 
A family of mystical swans glide across the surface, their feathers sparkling with magical energy.""",
        "grasslands" => """
🌾 The Ruby Grasslands stretch out before you, as far as you can see.
The tall grass sways in patterns that seem almost intentional, as if guided by unseen forces.
Ruby wildflowers dot the landscape, their petals glowing softly in the breeze.
You can hear the songs of crystal birds and feel the ancient magic that flows through this land.""",
        "tarpit" => """
⚫ Ahead of you lies the Cursed Tarpit, a scar upon the beautiful Ruby Kingdom. 
The ground feels like cursed syrup that grabs at your boots with each step. 
This place was once a thriving ruby mine until dark magic corrupted it. 
The twisted, blackened trees whisper warnings of the dangers that lurk in the shadows.""",
        "forest" => """
🌲 The trail winds into the Enchanted Ruby Forest, where ancient magic runs deepest. 
The towering trees are adorned with ruby bark that glows faintly in the dim light. 
Streams of magical energy filter down through the canopy like golden sunbeams. 
You hear the rustle of mystical creatures and feel the watchful eyes of forest guardians.""",
        "ruins" => """
🏛️ Before you stand the Ancient Ruby Ruins, remnants of the kingdom's earliest civilization. 
These weathered stone buildings once housed the first Ruby Mages who discovered the Heart's power. 
Ruby crystals still grow from the crumbling walls, pulsing with residual magic. 
The spirits of ancient scholars seem to whisper secrets of forgotten spells and lost treasures.""",
        "desert" => """
🏜️ The Ruby Desert spreads endlessly before you, its red sands sparkling like crushed gems. 
This harsh landscape tests the resolve of every adventurer who dares cross it. 
Mirages dance in the heat, sometimes revealing glimpses of the legendary Ruby Castle. 
The wind carries tales of buried treasures and the bones of those who couldn't find their way.""",
        "graveyard" => """
⚰️ The Hallowed Graveyard stands as a monument to Ruby Kingdom's fallen heroes. 
Ancient headstones bear the names of legendary warriors who died protecting the realm. 
Ruby roses grow wild here, their thorns sharp but their blooms beautiful. 
You feel a solemn reverence and the presence of noble spirits who still guard their sacred rest.""",
        "stream" => """
🏞️ The Ruby Stream winds through the landscape like a ribbon of liquid light. 
The crystal-clear water flows from the heart of the kingdom, carrying magical properties. 
Schools of rainbow fish swim in the current, their scales shimmering with ruby dust. 
Drinking from this stream is said to restore both body and spirit.""",
        "wasteland" => """
💀 The Forbidden Wasteland stretches before you, a realm where few dare to tread. 
The sky above churns with dark clouds shot through with ominous red lightning. 
This cursed land was created when dark sorcerers tried to steal the Ruby Heart's power. 
The bones of fallen monsters litter the ground, and shadows move independently of their casters.""",
        "castle" => """
🏰 The legendary Ruby Castle rises majestically before you, its crystalline spires reaching toward the heavens! 
Built from pure ruby crystal, the entire structure pulses with magical energy. 
This is the heart of Ruby Kingdom, where the Ruby Heart - source of all magic - awaits within. 
The drawbridge beckons you forward, as if the castle itself recognizes your worthy spirit.""",
        "shop" => """
🏪 The bustling Ruby Kingdom Market Square spreads out before you. 
Merchants from across the realm gather here to trade in magical goods and enchanted wares. 
The famous Ruby Kingdom Blacksmith's forge glows bright red, where legendary weapons are born. 
The air rings with the sound of hammers on enchanted metal and the chatter of adventurers planning their next quests."""

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
        random_number = rand(0..100)
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

