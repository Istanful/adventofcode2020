require_relative 'seat'
require_relative 'puzzle_input'

def find_missing_seat_id(
  all_ids = PUZZLE_INPUT.map(&Seat.method(:new)).map(&:seat_id),
  subject_ids = all_ids
)

  subject_id, *rest = subject_ids
  other_id = rest.find { |id| [subject_id + 2, subject_id - 2].include? id }

  return find_missing_seat_id(all_ids, rest) if other_id.nil?

  guess_id = [subject_id, other_id].min + 1

  return find_missing_seat_id(all_ids, rest) if all_ids.include?(guess_id)

  guess_id
end

pp find_missing_seat_id
gets
