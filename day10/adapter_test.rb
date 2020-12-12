require 'minitest/autorun'
require_relative 'adapter'

class AdapterTest < MiniTest::Test
  def test_compatible
    adapter = Adapter.new(25)

    assert_equal true, adapter.compatible_with?(Adapter.new(24))
    assert_equal true, adapter.compatible_with?(Adapter.new(23))
    assert_equal true, adapter.compatible_with?(Adapter.new(22))
  end

  def test_incombatible
    adapter = Adapter.new(25)

    assert_equal false, adapter.compatible_with?(Adapter.new(25))
    assert_equal false, adapter.compatible_with?(Adapter.new(26))
    assert_equal false, adapter.compatible_with?(Adapter.new(21))
  end
end
