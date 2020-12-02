require_relative 'puzzle_input'
require_relative 'sled_rental_password'

def part_1_solution(passwords = PUZZLE_INPUT)
  passwords.count do |input|
    SledRentalPassword.new(input).valid?
  end
end
