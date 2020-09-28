# Dependencies
require 'time'
require 'colorize'
require 'tty-prompt'
require 'terminal-table'
require_relative './animations.rb'
require_relative './classes.rb'
require_relative './interface.rb'


# Story Elements Module
module GameEngine



    def self.player_name
        puts InterfaceElements::INVISIBLE_SEPARATOR
        print "To start game, please input player name here: "
        player_name = gets.chomp
        player_name.to_s
        player_name.capitalize!
        GameEngine.player_class(player_name)
    end



    def self.player_class(player_name)
        InterfaceElements.clear
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Player class selection screen"
        puts InterfaceElements::VISIBLE_SEPARATOR
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "In the Augmented, you can play as either a Machine Tank or a Cyber Assassin:"
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Machine Tanks can sustain more damage and are masters of long range weaponry, however, their movements are slower."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Cyber Assassins move much quicker and do massive damage at close range, however, they have lower hit points."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        prompt = TTY::Prompt.new
        player_class_selection = [
            {name: 'Machine Tank', value: 1},
            {name: 'Cyber Assassin', value: 2},
          ]
        player_class = prompt.select("Please select your class:", player_class_selection)
  
        case player_class
        when 1
            InterfaceElements.clear
            new_player = MachineTank.new(player_name)
            GameEngine.story_intro_part_one(new_player)
        when 2
            InterfaceElements.clear
            new_player = CyberAssassin.new(player_name)
            GameEngine.story_intro_part_one(new_player)
        end
    end



    def self.story_intro_part_one(new_player)
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Intro: Part 1"
        puts InterfaceElements::VISIBLE_SEPARATOR
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "It is the year 2088"
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Advancements in technology has lead to an influx of a new generation of body modifications."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "These modifications are called augmentations, allowing humans and even animals to seamlessly fuse with"
        puts "advanced mechanical and soft technologies."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Though a great advancement and step towards human evolution..."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "the doors of the underworld have been opened to black market and extremely dangerous augmentations..."
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        prompt = TTY::Prompt.new
        continue_only = [
            {name: 'Yes', value: 1},
            {name: 'Back to Class Selection Screen', value: 2},
          ]
        continue_command = prompt.select("Game Controls:", continue_only)
  
        case continue_command
        when 1
            GameEngine.story_intro_part_two(new_player)
        when 2
            InterfaceElements.clear
            GameEngine.player_class(new_player)
        end
    end



    def self.story_intro_part_two(new_player)
        InterfaceElements.clear
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Intro: Part 2"
        puts InterfaceElements::VISIBLE_SEPARATOR
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You are heavily-augmented and highly-trained anti-terrorist agent, #{new_player.name.light_cyan} Caddel."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You are a #{new_player.class_name.light_cyan} class special agent."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        prompt = TTY::Prompt.new
        continue_only = [
            {name: 'Yes', value: 1},
            {name: 'Back', value: 2},
          ]
        continue_command = prompt.select("Game Controls:", continue_only)
  
        case continue_command
        when 1
            GameEngine.story_intro_part_three(new_player)
        when 2
            InterfaceElements.clear
            GameEngine.story_intro_part_one(new_player)
        end
    end



    def self.story_intro_part_three(new_player)
        InterfaceElements.clear
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "Intro: Part 3"
        puts InterfaceElements::VISIBLE_SEPARATOR
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You are on a ferry toward Staten Island."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "Your brother, agent Henderson Caddel is already there and waiting at the"
        puts "rendezvous point to debrief you."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "Heavily armed and highly augmented terrorists have taken over the island."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You have been deployed to investigate and neutralise the situation."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "It is 1:08am."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        prompt = TTY::Prompt.new
        continue_only = [
            {name: 'Yes', value: 1},
            {name: 'Back', value: 2},
          ]
        continue_command = prompt.select("Game Controls:", continue_only)
  
        case continue_command
        when 1
            GameEngine.location_rendezvuos_start(new_player)
        when 2
            InterfaceElements.clear
            GameEngine.story_intro_part_two(new_player)
        end
    end



    # Location: Rendezvuos Start
    def self.location_rendezvuos_start(new_player)
        InterfaceElements.clear
        sleep 1
        puts InterfaceElements::INVISIBLE_SEPARATOR
        puts "The Rendezvous"
        puts InterfaceElements::VISIBLE_SEPARATOR
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You arrive at the rendezvuos point and there is no sign of Henderson."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "As the ferry's engine fades into the distance, eerie silence begins to grow."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "It has become apparent that this situation has grown even more sinister."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        sleep 1
        puts "You decide to..."
        puts InterfaceElements::INVISIBLE_SEPARATOR
        InterfaceElements.game_controls(new_player)
    end
end









