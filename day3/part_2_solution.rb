require_relative 'toboggan'
require_relative 'part_1_solution'
require_relative 'puzzle_input'

def part_2_solution(traversals, input = PUZZLE_INPUT)
  traversals.inject(1) do |product, traversal|
    product * part_1_solution(input, traversal)
  end
end
