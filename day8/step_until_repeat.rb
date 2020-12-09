def step_until_repeat(program, visited_indices = [], previous_acc = program.accumulator)
  program.step

  return previous_acc if visited_indices.include? program.current_index
  return nil if program.completed?

  visited_indices << program.current_index
  step_until_repeat program, visited_indices, program.accumulator
end
