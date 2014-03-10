monopoly-sim
============

Quick little project to determine which Monopoly spaces are most likely to be landed on

# Usage

```
require_relative 'lib/monopoly_sim'

# Create a new simulator
simulator = MonopolySim::Simulator.new

# Simulate a token moving around the board
simulator.take_turns(1000000)

# Check out the results
puts "Property\tVisits"

simulator.properties.values.each do |property|
  puts "#{property.name}\t#{property.visits}"
end
```

# To do
* Package as an actual gem
