require_relative 'PUZZLE_INPUT'
require_relative 'waiting_area'

def part_1_solution(input = PUZZLE_INPUT)
  area = WaitingArea.new(input)
  loop do
    area.tick
    return area.occupied_seat_count if area.stable?
  end
end

pp part_1_solution
