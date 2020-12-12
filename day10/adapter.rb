class Adapter
  attr_reader :joltage

  def initialize(joltage)
    @joltage = joltage
  end

  def compatible_with?(adapter)
    (joltage - 3..joltage - 1).include? adapter.joltage
  end
end
