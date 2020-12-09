require_relative 'PUZZLE_INPUT'
require_relative 'bag_policy'
require_relative 'build_tree'

def part_1_solution(input = PUZZLE_INPUT, bag_type = "shiny gold")
  policies = input.map(&BagPolicy.method(:new))
  build_tree(policies, bag_type).keys.length
end

pp part_1_solution
