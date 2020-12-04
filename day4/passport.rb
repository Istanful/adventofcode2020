class Passport
  def initialize(str_input)
    @str_input = str_input
  end

  def keys
    to_h.keys
  end

  def [](key)
    to_h[key]
  end

  def to_h
    @str_input.split(/ |\n/)
              .reduce({}) do |acc, key_value_pair_str|
      key, value = key_value_pair_str.split(":")

      next acc if key.nil?

      { **acc, key.to_sym => value }
    end
  end
end
