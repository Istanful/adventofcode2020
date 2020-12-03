require 'minitest/autorun'
require 'ostruct'
require_relative 'part_2_solution'

class Part2Test < MiniTest::Test
  def test_example
    map_str = <<~TEXT
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    TEXT
    traversals = [
      OpenStruct.new(x: 1, y: 1),
      OpenStruct.new(x: 3, y: 1),
      OpenStruct.new(x: 5, y: 1),
      OpenStruct.new(x: 7, y: 1),
      OpenStruct.new(x: 1, y: 2),
    ]

    result = part_2_solution(traversals, map_str)

    assert_equal 336, result
  end

  def test_solution
    traversals = [
      OpenStruct.new(x: 1, y: 1),
      OpenStruct.new(x: 3, y: 1),
      OpenStruct.new(x: 5, y: 1),
      OpenStruct.new(x: 7, y: 1),
      OpenStruct.new(x: 1, y: 2),
    ]

    assert_equal 1, part_2_solution(traversals)
  end
end
