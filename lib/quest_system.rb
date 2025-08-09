require "./lib/text_style.rb"

class Quest
  attr_accessor :name, :description, :type, :target, :progress, :max_progress, :reward_gold, :reward_exp, :completed
  
  def initialize(name, description, type, target, max_progress, reward_gold, reward_exp)
    @name = name
    @description = description
    @type = type # :kill, :collect, :explore, :deliver
    @target = target
    @progress = 0
    @max_progress = max_progress
    @reward_gold = reward_gold
    @reward_exp = reward_exp
    @completed = false
  end
  
  def update_progress(amount = 1)
    return if @completed
    
    @progress += amount
    @progress = [@progress, @max_progress].min
    
    if @progress >= @max_progress && !@completed
      complete_quest
    end
  end
  
  def complete_quest
    @completed = true
    puts
    puts "🎉 QUEST COMPLETED: #{@name}!".green.bold
    puts "Reward: #{@reward_gold} gold, #{@reward_exp} EXP".yellow
  end
  
  def progress_text
    "#{@progress}/#{@max_progress}"
  end
  
  def self.starter_quests
    [
      Quest.new(
        "First Blood",
        "Defeat your first enemy in Ruby Kingdom",
        :kill,
        "any",
        1,
        25,
        15
      ),
      Quest.new(
        "Explorer",
        "Visit 3 different locations",
        :explore,
        "locations",
        3,
        50,
        25
      ),
      Quest.new(
        "Collector",
        "Find the Ruby Castle",
        :explore,
        "castle",
        1,
        100,
        50
      )
    ]
  end
end

module QuestSystem
  @@active_quests = []
  @@completed_quests = []
  
  def self.initialize_starter_quests
    @@active_quests = Quest.starter_quests
    puts "📜 You have received starter quests! Check your quest log anytime.".cyan
  end
  
  def self.update_quest_progress(type, target = nil)
    @@active_quests.each do |quest|
      next if quest.completed
      
      case quest.type
      when :kill
        if type == :enemy_killed && (quest.target == "any" || quest.target == target)
          quest.update_progress
        end
      when :explore
        if type == :location_visited && (quest.target == "locations" || quest.target == target)
          quest.update_progress
        end
      end
    end
    
    # Move completed quests
    completed = @@active_quests.select(&:completed)
    completed.each do |quest|
      @@completed_quests << quest
      @@active_quests.delete(quest)
      
      # Give rewards
      $current_character.set_gold(quest.reward_gold, true)
      $current_character.add_exp(quest.reward_exp)
    end
  end
  
  def self.show_quest_log
    puts "\n=== QUEST LOG ===".cyan.bold
    puts
    
    if @@active_quests.empty?
      puts "No active quests.".gray
    else
      puts "Active Quests:".green
      @@active_quests.each_with_index do |quest, index|
        status = quest.completed ? "[COMPLETE]".green : "[#{quest.progress_text}]".yellow
        puts "  #{index + 1}. #{quest.name} #{status}"
        puts "     #{quest.description}".gray
      end
    end
    
    puts
    
    if @@completed_quests.any?
      puts "Completed Quests: #{@@completed_quests.length}".green
    end
    
    puts
    puts "Press Enter to continue...".gray
    gets
  end
  
  def self.active_quests
    @@active_quests
  end
  
  def self.completed_quests
    @@completed_quests
  end
end