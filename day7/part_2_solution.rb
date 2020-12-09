require_relative 'PUZZLE_INPUT'
require_relative 'build_tree'
require_relative 'bag_policy'

def part_2_solution(input = PUZZLE_INPUT)
  policies = input.map(&BagPolicy.method(:new))
  tree = build_tree("shiny gold", policies)
  count_bags(tree) - 1
end

def count_bags(tree)
  1 + tree[:children].sum do |child|
    child[:count] * count_bags(child)
  end
end

def build_tree(bag_type, policies, tree = {})
  policy = policies.find { |p| p.bag_type == bag_type }
  children = policy.bag_counts.map do |bag_count|
    build_tree bag_count[:color], policies, bag_count
  end
  { **tree, color: policy.bag_type, children: children }
end

pp part_2_solution
