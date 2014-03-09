class MonopolySim::Property
  GO = 0
  READING_RAILROAD = 5
  JAIL = 10
  ST_CHARLES_PLACE = 11
  ILLINOIS_AVENUE = 24
  BOARDWALK = 39

  attr_accessor :name, :type, :visits

  def initialize(params)
    params.each {|k, v| self.send("#{k}=", v)}
    @visits = 0
  end

  def chance?
    type == 'chance'
  end

  def community_chest?
    type == 'community_chest'
  end

  def go_to_jail?
    type == 'go_to_jail'
  end

  def utility?
    type == 'utility'
  end

  def railroad?
    type == 'railroad'
  end

  def purchasable?
    ['property', 'railroad', 'utility'].include?(type)
  end

  def visit!
    @visits += 1
  end
end