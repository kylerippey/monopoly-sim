require_relative 'lib/monopoly_sim'

# Create a new simulator
simulator = MonopolySim::Simulator.new

# Take some turns
simulator.take_turns(1000000)

# Check out the results
puts "Property\tVisits"

simulator.properties.values.each do |property|
  puts "#{property.name}\t#{property.visits}"
end