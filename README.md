# Ruby Kingdom - Enhanced Text Adventure

A mystical text-based adventure game built in Ruby, where code and magic intertwine! Explore the Ruby Kingdom, complete quests, battle monsters, and seek the legendary Ruby Castle where the Heart of Ruby awaits.

## ✨ New Features

### 🛡️ Local Save System
- **Unlimited save slots** - Create as many saves as you want
- **Named saves** - Give your saves custom names or use auto-generated ones
- **Complete character persistence** - All progress, items, stats, and location saved
- **Load/Delete management** - Easy save file management from main menu
- **No authentication required** - Removed Firebase dependency for local-only saves

### 📜 Quest System
- **Starter quests** automatically given to new characters
- **Quest tracking** with progress indicators
- **Multiple quest types**: Kill enemies, explore locations, find special areas
- **Rewards** including gold and experience points
- **Quest log** accessible anytime during gameplay

### 🗺️ Enhanced Exploration
- **Rich location descriptions** with Ruby Kingdom lore
- **9 unique biomes**: Ruby Forest, Crystal Lake, Cursed Tarpit, Ancient Ruins, and more
- **Location tracking** for quest progression
- **Visual map** showing your current position
- **Discovery rewards** for visiting new areas

### ⚔️ Improved Combat
- **Enhanced battle feedback** with emojis and better descriptions
- **Quest integration** - battles contribute to quest progress
- **Balanced enemy scaling** based on player level
- **Victory rewards** with gold and experience

### 🏪 Advanced Shop System
- **Ruby Kingdom Blacksmith** with immersive dialogue
- **6 item categories**: Weapons, potions, shields, magic items
- **Magical effects**: Ruby-touched items with special powers
- **Stat upgrades**: Permanent improvements to attack, HP, and more
- **Lore integration**: Shop items tied to Ruby Kingdom mythology

### 🎒 Enhanced Character System
- **Detailed inventory** showing equipped items and stats
- **Character progression** with leveling and stat growth
- **Three classes**: Warrior, Mage, Programmer (each with unique starting equipment)
- **Comprehensive stats tracking**: HP, Attack, Gold, EXP, Level

## 🎮 How to Play

### Starting the Game
1. Run `ruby main.rb`
2. Choose from the main menu:
   - **Load Game** - Continue from a saved adventure
   - **New Game** - Create a new character
   - **Delete Save** - Remove unwanted save files
   - **Exit** - Close the game

### Character Creation
1. Choose your character name
2. Select your class:
   - **Warrior** - Master of blade and battle
   - **Mage** - Wielder of arcane mysteries
   - **Programmer** - Hacker of reality's code

### Gameplay Commands
- **Move** - Travel between locations (North, South, East, West)
- **Fight** - Battle enemies for gold and experience
- **Check Inventory** - View items, stats, and equipment
- **Quest Log** - Track active and completed quests
- **Save Game** - Save your progress at any time
- **Shop** - Purchase weapons, potions, and magical items (when available)

### Quest System
- New characters receive starter quests automatically
- Complete quests by killing enemies, exploring locations, or finding special places
- Check your Quest Log regularly to track progress
- Completed quests provide gold and experience rewards

## 🌟 Game Features

### Save System
- Saves stored in `saves/` directory as JSON files
- Automatic backup of all character data
- Unlimited save slots with custom naming
- Easy save management from main menu

### Combat
- Turn-based battle system
- Enemy difficulty scales with player level
- Creative combat input (shout battle cries!)
- Quest progress tracking for victories

### Exploration
- 3x3 grid world with 9 unique locations
- Each location features rich descriptions and unique atmosphere
- Random enemy encounters and special locations
- Castle and shop locations for advanced gameplay

### Character Progression
- Experience points and leveling system
- Gold economy for purchasing upgrades
- Equipment system with weapon upgrades
- Stat improvements through items and leveling

## 🔧 Technical Details

### Dependencies
- Ruby (no external gems required)
- JSON support for save system
- File system access for save storage

### Installation
1. Clone the repository
2. Navigate to the game directory
3. Run `ruby main.rb`

### File Structure
```
lib/
├── auth.rb (legacy - can be removed)
├── character.rb - Character class and stats
├── enemy.rb - Enemy generation and combat
├── game.rb - Main game loop and combat system
├── intro.rb - Game initialization
├── items.rb - Item definitions
├── location.rb - Location generation and descriptions
├── main_menu.rb - Main menu and character creation
├── map.rb - World map and navigation
├── menu.rb - In-game menu system
├── quest_system.rb - Quest management and tracking
├── save_system.rb - Save/load functionality
└── [other support files]
saves/ - Save game files (auto-created)
```

## 🎯 Ruby Kingdom Lore

In the mystical Ruby Kingdom, ancient magic flows through crystalline formations scattered across the land. The legendary Ruby Castle holds the Heart of Ruby - the source of all magical power in the realm. As an adventurer, you must explore diverse biomes, from the Enchanted Ruby Forest to the Cursed Tarpit, seeking the castle while growing stronger through quests and battles.

Each location tells part of the kingdom's story:
- **Ruby Mountain** - Ancient runes tell of brave adventurers
- **Crystal Lake** - Blessed waters that sparkle with ruby energy  
- **Ancient Ruins** - Remnants of the first Ruby Mages
- **Forbidden Wasteland** - Cursed lands where dark magic failed

The Ruby Kingdom Blacksmith forges legendary weapons infused with the land's magical power, helping adventurers prepare for the challenges ahead.

---

*Find the Ruby Castle. Claim your destiny. The Heart of Ruby awaits...*
