require 'minitest/autorun'
require_relative 'part_1_solution'

class Part1SolutionTest < MiniTest::Test
  def test_example
    input = [
      "nop +0",
      "acc +1",
      "jmp +4",
      "acc +3",
      "jmp -3",
      "acc -99",
      "acc +1",
      "jmp -4",
      "acc +6",
    ]

    assert_equal 5, part_1_solution(input)
  end
end
