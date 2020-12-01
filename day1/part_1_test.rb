require 'minitest/autorun'
require_relative './puzzle_input'
require_relative './part_1_solution'

class Part1Test < MiniTest::Test
  def test_multiplies_two_correct_values
    assert_equal 1_020_000, part_1_solution([1000, 1020])
  end

  def test_ignores_two_incorrect_values
    assert_equal nil, part_1_solution([1000, 1000])
  end

  def test_multiplies_from_three_values
    assert_equal 1_020_000, part_1_solution([1000, 3, 1020])
  end

  def test_multiplies_from_three_values_scrambled
    assert_equal 1_020_000, part_1_solution([3, 1000, 1020])
  end

  def test_solution
    assert_equal 270144, part_1_solution(PUZZLE_INPUT)
  end
end
