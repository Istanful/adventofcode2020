require_relative 'PUZZLE_INPUT'
require_relative 'step_until_repeat'
require_relative 'instruction'
require_relative 'program'

def part_2_solution(input = PUZZLE_INPUT)
  instructions = input.map(&Instruction.method(:new))
  find_exiting_accumulator instructions
end

def find_exiting_accumulator(instructions, offset = 0)
  instruction = instructions.select { |x| %i[jmp nop].include? x.operation }[offset]
  instruction.swap_operation(%i[jmp nop])
  program = Program.new(instructions)
  acc = step_until_repeat(program)

  return step_until_completion(program) if acc.nil?

  instruction.swap_operation(%i[jmp nop])
  find_exiting_accumulator(instructions, offset + 1)
end

def step_until_completion(program)
  return program.accumulator if program.completed?

  step_until_completion(program)
end

pp part_2_solution
