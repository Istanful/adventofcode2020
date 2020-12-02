require 'minitest/autorun'
require_relative './part_1_solution'

class Part1Test < MiniTest::Test
  def test_valid_passwords
    assert_equal true, SledRentalPassword.new('1-3 a: abcde').valid?
    assert_equal true, SledRentalPassword.new('2-9 c: ccccccccc').valid?
    assert_equal true, SledRentalPassword.new('2-11 c: ccaaaa').valid?
  end

  def test_invalid_password
    assert_equal false, SledRentalPassword.new('1-3 b: cdefg').valid?
    assert_equal false, SledRentalPassword.new('1-300 b: cdefg').valid?
  end

  def test_solution
    assert_equal 636, part_1_solution
  end
end
