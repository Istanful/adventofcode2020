require_relative 'waiting_area'
require 'minitest/autorun'

class WaitingAreaTest < MiniTest::Test
  def test_one_round
    input = <<~TEXT.chomp
    L.LL.LL.LL
    LLLLLLL.LL
    L.L.L..L..
    LLLL.LL.LL
    L.LL.LL.LL
    L.LLLLL.LL
    ..L.L.....
    LLLLLLLLLL
    L.LLLLLL.L
    L.LLLLL.LL
    TEXT
    area = WaitingArea.new(input)

    area.tick

    expected = <<~TEXT.chomp
    #.##.##.##
    #######.##
    #.#.#..#..
    ####.##.##
    #.##.##.##
    #.#####.##
    ..#.#.....
    ##########
    #.######.#
    #.#####.##
    TEXT
    assert_equal expected, area.state
  end

  def test_two_rounds
    input = <<~TEXT.chomp
    L.LL.LL.LL
    LLLLLLL.LL
    L.L.L..L..
    LLLL.LL.LL
    L.LL.LL.LL
    L.LLLLL.LL
    ..L.L.....
    LLLLLLLLLL
    L.LLLLLL.L
    L.LLLLL.LL
    TEXT
    area = WaitingArea.new(input)

    area.tick
    pp area.state
    area.tick

    expected = <<~TEXT.chomp
    #.LL.L#.##
    #LLLLLL.L#
    L.L.L..L..
    #LLL.LL.L#
    #.LL.LL.LL
    #.LLLL#.##
    ..L.L.....
    #LLLLLLLL#
    #.LLLLLL.L
    #.#LLLL.##
    TEXT

    assert_equal expected, area.state
  end
end
