require 'minitest/autorun'
require_relative 'part_2_solution'
require_relative 'toboggan_password'

class Part2Test < MiniTest::Test
  def test_valid_passwords
    assert_equal true, TobogganPassword.new('1-3 b: bdafg').valid?
    assert_equal true, TobogganPassword.new('1-10 b: adafgiiiib').valid?
    assert_equal true, TobogganPassword.new('1-9 c: acccccccc').valid?
    assert_equal true, TobogganPassword.new('5-6 d: dcdddhzld').valid?
    assert_equal true, TobogganPassword.new('9-16 d: dsdddddddrdddddhdbddx').valid?
  end

  def test_invalid_passwords
    assert_equal false, TobogganPassword.new('1-3 b: bdbfg').valid?
    assert_equal false, TobogganPassword.new('2-9 c: ccccccccc').valid?
    assert_equal false, TobogganPassword.new('1-9 c: a').valid?
    assert_equal false, TobogganPassword.new('1-2 c: aa').valid?
    assert_equal false, TobogganPassword.new('5-6 w: wwwwwww').valid?
  end

  def test_solution
    assert_equal 588, part_2_solution
  end
end
