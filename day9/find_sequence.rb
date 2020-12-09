def find_sequence(numbers, desired_sum, offset = 0, size = 2)
  min_index = offset
  max_index = offset + size - 1
  subject_numbers = numbers[min_index..max_index]
  sum = subject_numbers.sum

  return find_sequence(numbers, desired_sum, offset, size + 1) if subject_numbers.length == 1

  return subject_numbers.min + subject_numbers.max if sum == desired_sum

  return find_sequence(numbers, desired_sum, offset + 1, size - 1) if sum > desired_sum

  find_sequence(numbers, desired_sum, offset, size + 1)
end
