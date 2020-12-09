require_relative 'xmas_cypher'

def find_first_invalid_number(numbers, offset = 0, preamble_length: 25)
  cypher = XmasCypher.new(numbers[0..(offset + preamble_length - 1)], preamble_length: preamble_length)
  index = offset + preamble_length
  number = numbers[index]

  return find_first_invalid_number(numbers, offset + 1, preamble_length: preamble_length) if cypher.valid_next_number?(number)

  number
end
