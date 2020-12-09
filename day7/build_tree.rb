def build_tree(policies, bag_type, tree = build_leaf_nodes(policies, bag_type))
  policy, *rest = policies

  new_tree = tree.keys.reduce(tree) do |acc, other_bag_type|
    if policy.can_directly_contain?(other_bag_type.to_s)
      next {
        **acc,
        policy.bag_type.to_sym => {
          count: policy.direct_bag_count,
          other_bag_type.to_sym => acc[other_bag_type]
        }
      }
    end

    acc
  end

  return new_tree if rest.empty?
  return build_tree([*rest, policy], bag_type, new_tree) if rest.any? { |r| policy.can_directly_contain? r.bag_type }

  build_tree(rest, bag_type, new_tree)
end

def build_leaf_nodes(policies, bag_type, tree = {})
  policy, *rest = policies

  return tree if policy.nil?

  if policy.can_directly_contain?(bag_type)
    return build_leaf_nodes(rest, bag_type, { policy.bag_type.to_sym => bag_type, **tree })
  end

  build_leaf_nodes rest, bag_type, tree
end

