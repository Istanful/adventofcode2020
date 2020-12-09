require_relative 'PUZZLE_INPUT'
require_relative 'find_first_invalid_number'

def part_1_solution(input = PUZZLE_INPUT, preamble_length: 25)
  numbers = input.map(&:to_i)
  find_first_invalid_number(numbers, 0, preamble_length: preamble_length)
end

pp part_1_solution
