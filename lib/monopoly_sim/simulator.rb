require 'yaml'

class MonopolySim::Simulator
  attr_reader :properties, :token, :community_chest_deck, :chance_deck

  def initialize
    @token = MonopolySim::Token.new
    @community_chest_deck = MonopolySim::Deck.new
    @chance_deck = MonopolySim::Deck.new

    # load properties
    @properties = Hash.new
    YAML.load_file('data/properties.yml').each {|k,v| @properties[k] = MonopolySim::Property.new(v)}
  end

  def take_turns(n=1)
    n.times do
      # Roll the dice and advance the player
      token.move(roll)

      # 'visit' this property
      current_property.visit!

      # Perform additional actions (chance cards, go to jail, etc)
      additional_actions
    end
  end

  private

  def roll
    rand(6) + rand(6) + 2
  end

  def current_property
    properties[token.location]
  end

  def additional_actions
    if current_property.chance?
      # Take a chance card
      take_a_chance
    elsif current_property.community_chest?
      # Take a community chest card
      take_a_community_chest
    elsif current_property.go_to_jail?
      # Go directly to jail
      token.go_to MonopolySim::Property::JAIL
      current_property.visit!
    end
  end

  def take_a_chance
    case chance_deck.draw!
    when 0
      # Advance to Go
      token.go_to MonopolySim::Property::GO # Advance to Go
      current_property.visit!
    when 1
      # Go directly to Jail
      token.go_to MonopolySim::Property::JAIL # Go to Jail
      current_property.visit!
    end
  end

  def take_a_community_chest
    case community_chest_deck.draw!
    when 0
      # Advance to Go
      token.go_to MonopolySim::Property::GO
      current_property.visit!
    when 1
      # Take a ride on the Reading
      token.go_to MonopolySim::Property::READING_RAILROAD
      current_property.visit!
    when 2
      # Go directly to Jail
      token.go_to MonopolySim::Property::JAIL
      current_property.visit!
    when 3
      # Go to St Charles Place
      token.go_to MonopolySim::Property::ST_CHARLES_PLACE
      current_property.visit!
    when 4
      # Go to Illinois Avenue
      token.go_to MonopolySim::Property::ILLINOIS_AVENUE
      current_property.visit!
    when 5
      # Take a walk on the Boardwalk
      token.go_to MonopolySim::Property::BOARDWALK
      current_property.visit!
    when 6
      # Go back 3 spaces
      token.move -3
      current_property.visit!
      additional_actions
    when 7
      # Advance token to nearest utility
      token.move(1) while !current_property.utility?
      current_property.visit!
    when 8
      # Advance token to nearest railroad
      token.move(1) while !current_property.railroad?
      current_property.visit!
    end
  end
end