require 'minitest/autorun'
require_relative 'xmas_cypher'

class XmasCypherTest < MiniTest::Test
  def test_example
    numbers = [
      35,
      20,
      15,
      25,
      47,
      40,
      62,
      55,
      65,
      95,
      102,
      117,
      150,
      182,
      127,
      219,
      299,
      277,
      309,
      576,
    ]

    assert_equal true, XmasCypher.new(numbers[0..9], preamble_length: 5).valid_next_number?(102)
    assert_equal true, XmasCypher.new(numbers[0..10], preamble_length: 5).valid_next_number?(117)
    assert_equal false, XmasCypher.new(numbers[0..13], preamble_length: 5).valid_next_number?(127)
  end
end
