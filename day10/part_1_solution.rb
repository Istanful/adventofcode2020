require_relative 'PUZZLE_INPUT'
require_relative 'adapter'

def part_1_solution(input = PUZZLE_INPUT)
  built_in_adapter = Adapter.new(input.max + 3)
  adapters = [0, *input, input.max + 3]
    .map(&Adapter.method(:new))
    .sort_by(&:joltage)

  counts = adapters.each_with_index.drop(1).reduce([0, 0]) do |acc, (adapter, i)|
    previous_adapter = adapters[i - 1]
    delta_joltage = (adapter.joltage - previous_adapter.joltage)
    acc[0] += 1 if delta_joltage == 1
    acc[1] += 1 if delta_joltage == 3
    acc
  end

  counts.reduce(&:*)
end

pp part_1_solution
