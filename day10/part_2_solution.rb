require_relative 'PUZZLE_INPUT'
require_relative 'adapter'

def part_2_solution(input = PUZZLE_INPUT)
  adapters = [0, *input, input.max + 3]
    .map(&Adapter.method(:new))
    .sort_by(&:joltage)
  1 + find_valid_arrangements(adapters).size
end

class Foo
  class << self
    attr_accessor :tested
  end
end

def find_valid_arrangements(adapters, depth = 0, expendables = nil)
  Foo.tested ||= []
  if Foo.tested.include?(adapters)
    pp adapters.map(&:joltage)
    throw "HOL UP!"
  end
  Foo.tested << adapters
  pp depth
  pp Foo.tested
  sleep 0.1
  expendables ||= adapters.each_with_index.drop(1).select do |(a, i)|
    next false if adapters[i + 1].nil?

    (adapters[i + 1].joltage - adapters[i - 1].joltage) <= 3
  end.map(&:first)

  return [] if expendables.empty?

  expendables.each_with_index.reduce([]) do |acc, (adapter, i)|
    arrangement = adapters - [adapter]
    [
      *acc,
      arrangement,
      *find_valid_arrangements(arrangement, depth + 1, expendables.drop(i + 1))
    ]
  end

  # pp "TEsting #{adapters.map(&:joltage)}"
  # Foo.tested ||= []
  # Foo.tested << adapters
  # adapters.each_with_index.drop(1).reduce([]) do |arrangements, (adapter, i)|
  #   # Foo.iterations ||= 0
  #   # Foo.iterations += 1
  #   # print "\r #{Foo.iterations} having size: #{arrangements.size}".rjust(100, ' ')

  #   next arrangements if adapters[i + 1].nil?

  #   delta_joltage = (adapters[i + 1].joltage - adapters[i - 1].joltage)

  #   expendable =  delta_joltage <= 3

  #   next arrangements unless expendable

  #   arrangement = adapters - [adapter]
  #   pp walked_paths
  #   pp "HOL UP!. Already tested!" if walked_paths.include? adapter

  #   # puts "Testing nested arrs for #{adapter.joltage} at #{i}"
  #   [
  #     *arrangements,
  #     arrangement,
  #     *find_valid_arrangements(arrangement, [*walked_paths, adapter])
  #   ]
  # end
end

pp part_2_solution if ARGV[0] == "run"
