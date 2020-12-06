require_relative 'PUZZLE_INPUT'

def part_1_solution(input = PUZZLE_INPUT)
  input.split(/\n{2}/)
       .map { |group| group.split("") }
       .map(&:uniq)
       .sum(&:length)
end

pp part_1_solution
