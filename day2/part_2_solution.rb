require_relative 'toboggan_password'
require_relative 'puzzle_input'

def part_2_solution(passwords = PUZZLE_INPUT)
  passwords.count do |input|
    TobogganPassword.new(input).valid?
  end
end
