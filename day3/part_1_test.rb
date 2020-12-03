require 'minitest/autorun'
require_relative 'toboggan'
require_relative 'part_1_solution'

class Part1Test < MiniTest::Test
  def test_move_once
    vehicle = Toboggan.new(<<~TEXT.chomp
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
    )

    vehicle.move

    assert_equal ".", vehicle.ground
  end

  def test_move_twice
    vehicle = Toboggan.new(<<~TEXT.chomp
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
    )

    vehicle.move
    vehicle.move

    assert_equal "#", vehicle.ground
  end

  def test_move_out_of_bounds_repeats
    vehicle = Toboggan.new(<<~TEXT.chomp
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
    )

    vehicle.move
    vehicle.move
    vehicle.move
    vehicle.move

    assert_equal "#", vehicle.ground
  end

  def test_example
    result = part_1_solution(<<~TEXT.chomp
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
    )

    assert_equal 7, result
  end

  def test_solution
    assert_equal 268, part_1_solution
  end
end
