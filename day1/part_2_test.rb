require 'minitest/autorun'
require_relative './part_2_solution'
require_relative './puzzle_input'

class Part2Test < MiniTest::Test
  def test_three_correct_values
    assert_equal 255_000_000, part_2_solution([500, 500, 1020])
  end

  def test_ignores_three_incorrect_values
    assert_nil part_2_solution([100, 500, 1020])
  end

  def test_four_values
    assert_equal 255_000_000, part_2_solution([500, 100, 500, 1020])
  end

  def test_four_scrambled_values
    assert_equal 255_000_000, part_2_solution([100, 500, 500, 1020])
  end

  def test_example
    numbers = [
      1721,
      979,
      366,
      299,
      675,
      1456,
    ]

    assert_equal 241861950, part_2_solution(numbers)
  end

  def test_solution
    assert_equal 261342720, part_2_solution(PUZZLE_INPUT)
  end
end
