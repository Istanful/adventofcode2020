require_relative 'PUZZLE_INPUT'
require_relative 'program'
require_relative 'instruction'

def part_1_solution(input = PUZZLE_INPUT)
  instructions = input.map(&Instruction.method(:new))
  program = Program.new(instructions)
  step_until_repeat program
end

def step_until_repeat(program, visited_indices = [], previous_acc = program.accumulator)
  program.step

  return previous_acc if visited_indices.include? program.current_index

  visited_indices << program.current_index
  step_until_repeat program, visited_indices, program.accumulator
end

pp part_1_solution

