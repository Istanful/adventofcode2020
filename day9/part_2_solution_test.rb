require_relative 'part_2_solution'
require 'minitest/autorun'

class Part2SolutionTest < MiniTest::Test
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

    assert_equal 62, part_2_solution(input, preamble_length: 5)
  end
end
