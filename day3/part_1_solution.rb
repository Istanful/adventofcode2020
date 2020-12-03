require_relative 'puzzle_input'
require_relative 'toboggan'
require 'ostruct'

def part_1_solution(input = PUZZLE_INPUT, traversal = OpenStruct.new(x: 3, y: 1))
  toboggan = Toboggan.new(input, traversal)
  encountered_trees_count = 0;

  loop do
    encountered_trees_count += 1 if toboggan.ground == "#"
    toboggan.move
    break if toboggan.ground.nil?
  end

  encountered_trees_count
end
