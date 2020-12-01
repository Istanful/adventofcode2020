def part_1_solution(input, desired_sum = 2020)
  subject, *rest = input
  addend = rest.find { |other| other + subject == desired_sum }

  return nil if rest.empty?
  return part_1_solution(rest, desired_sum) if addend.nil?

  subject * addend
end
