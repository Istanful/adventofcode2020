require_relative 'PUZZLE_INPUT'

def part_2_solution(input = PUZZLE_INPUT)
  input.split(/\n{2,}/)
       .map { |group| group.split("\n").map(&:chars) }
       .map { |group_chars| group_chars.reduce(group_chars[0]) { |acc, chars| acc & chars }  }
       .sum(&:length)
end

pp part_2_solution
