require 'minitest/autorun'
require_relative 'part_1_solution'

class Part1SolutionTest < MiniTest::Test
  def test_example
    input = [
      35,
      20,
      15,
      25,
      47,
      40,
      62,
      55,
      65,
      95,
      102,
      117,
      150,
      182,
      127,
      219,
      299,
      277,
      309,
      576,
    ]

    assert_equal 127, part_1_solution(input, preamble_length: 5)
  end
end
