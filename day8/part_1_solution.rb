require_relative 'PUZZLE_INPUT'
require_relative 'program'
require_relative 'instruction'
require_relative 'step_until_repeat'

def part_1_solution(input = PUZZLE_INPUT)
  instructions = input.map(&Instruction.method(:new))
  program = Program.new(instructions)
  step_until_repeat program
end

pp part_1_solution

