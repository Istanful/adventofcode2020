require 'minitest/autorun'
require_relative 'bag_policy'

class BagPolicyTest < MiniTest::Test
  def test_can_contain_directly
    policy = BagPolicy.new("bright white bags contain 1 shiny gold bag.")

    assert_equal true, policy.can_directly_contain?("shiny gold")
  end

  def test_cannot_contain
    policy = BagPolicy.new("faded blue bags contain no other bags.")

    assert_equal false, policy.can_directly_contain?("shiny gold")
  end

  def test_same_policy
    policy = BagPolicy.new("shiny gold bags contain no other bags")

    assert_equal false, policy.can_directly_contain?("shiny gold")
  end

  def test_bag_type
    policy = BagPolicy.new("dark orange bags contain 3 bright white bags, 4 muted yellow bags.")

    assert_equal "dark orange", policy.bag_type
  end

  def test_direct_bag_count
    policy = BagPolicy.new("light red bags contain 1 bright white bag, 2 muted yellow bags.")

    assert_equal 3, policy.direct_bag_count
  end
end
