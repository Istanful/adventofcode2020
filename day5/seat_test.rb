require 'minitest/autorun'
require_relative 'seat'

class SeatTest < MiniTest::Test
  def test_row
    assert_equal 44, Seat.new("FBFBBFFRLR").row
  end

  def test_column
    assert_equal 5, Seat.new("FBFBBFFRLR").column
  end

  def test_seat_id
    assert_equal 357, Seat.new("FBFBBFFRLR").seat_id
  end
end
