class XmasCypher
  attr_reader :numbers
  attr_reader :preamble_length

  def initialize(numbers, preamble_length: 25)
    @numbers = numbers
    @preamble_length = preamble_length
  end

  def valid_next_number?(num)
    preamble.combination(2).map(&:sum).include? num
  end

  private

  def preamble
    @numbers[-@preamble_length..@numbers.length]
  end
end
