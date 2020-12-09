require_relative 'part_2_solution'
require 'minitest/autorun'

class Part2SolutionTest < MiniTest::Test
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

    assert_equal 8, part_2_solution(input)
  end
end
