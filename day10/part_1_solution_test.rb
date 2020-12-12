require 'minitest/autorun'
require_relative 'part_1_solution'

class Part1SolutionTest < MiniTest::Test
  def test_example
    input = [
      16,
      10,
      15,
      5,
      1,
      11,
      7,
      19,
      6,
      12,
      4,
    ]

    assert_equal 35, part_1_solution(input)
  end
end
