require_relative 'part_1_solution'
require 'minitest/autorun'

class Part1SolutionTest < MiniTest::Test
  def test_example
    input = [
      "light red bags contain 1 bright white bag, 2 muted yellow bags.",
      "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
      "bright white bags contain 1 shiny gold bag.",
      "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
      "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
      "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
      "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
      "faded blue bags contain no other bags.",
      "dotted black bags contain no other bags.",
    ]

    assert_equal 4, part_1_solution(input)
  end

  def test_nested
    input = [
      "light red bags contain 1 bright white bag.",
      "bright white bags contain 1 dark orange bag.",
      "dark orange bags contain 1 shiny gold.",
    ]

    assert_equal 3, part_1_solution(input)
  end

  def test_nested_with_non_matching
    input = [
      "black bags contain no bags.",
      "light red bags contain 1 bright white bag.",
      "bright white bags contain 1 dark orange bag.",
      "dark orange bags contain 1 shiny gold.",
    ]

    assert_equal 3, part_1_solution(input)
  end

  def test_keeps_unmatched
    input = [
      "green bags contain 1 bright white bag.",
      "light red bags contain 1 bright white bag.",
      "bright white bags contain 1 dark orange bag.",
      "purple bags contain 1 bright white bag.",
      "dark orange bags contain 1 shiny gold.",
    ]

    assert_equal 5, part_1_solution(input)
  end
end
