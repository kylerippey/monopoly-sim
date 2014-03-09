module MonopolySim
  autoload :Simulator, File.join(File.dirname(__FILE__), 'monopoly_sim/simulator')
  autoload :Property, File.join(File.dirname(__FILE__), 'monopoly_sim/property')
  autoload :Token, File.join(File.dirname(__FILE__), 'monopoly_sim/token')
  autoload :Deck, File.join(File.dirname(__FILE__), 'monopoly_sim/deck')
end
