require_relative './part_1_solution'

def part_2_solution(input, desired_sum = 2020)
  subject, *rest = input

  return nil if rest.empty?

  required_difference = desired_sum - subject
  appendends_product = part_1_solution(rest, required_difference)

  return part_2_solution(rest, desired_sum) if appendends_product.nil?

  subject * appendends_product
end
