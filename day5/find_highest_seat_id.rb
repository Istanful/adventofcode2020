require_relative 'puzzle_input'
require_relative 'seat'

def find_highest_seat_id(input = PUZZLE_INPUT)
  input.map(&Seat.method(:new)).map(&:seat_id).max
end

pp find_highest_seat_id
gets
