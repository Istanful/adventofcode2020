require 'ostruct'
require_relative 'map'

class Toboggan
  def initialize(map_str, traversal = OpenStruct.new(x: 3, y: 1))
    @map = Map.new(map_str)
    @position = OpenStruct.new(x: 0, y: 0)
    @traversal = traversal
  end

  def move
    @position = OpenStruct.new(
      x: @position.x + @traversal.x,
      y: @position.y + @traversal.y
    )
  end

  def ground
    @map[@position.x][@position.y]
  end
end
