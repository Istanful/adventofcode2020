require_relative 'find_first_invalid_number'
require_relative 'PUZZLE_INPUT'
require_relative 'find_sequence'

def part_2_solution(input = PUZZLE_INPUT, preamble_length: 25)
  numbers = input.map(&:to_i)
  number = find_first_invalid_number(numbers, preamble_length: preamble_length)
  find_sequence numbers, number
end

pp part_2_solution
