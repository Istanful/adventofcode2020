class Program
  attr_accessor :current_index
  attr_accessor :accumulator

  def initialize(instructions)
    @instructions = instructions
    @current_index = 0
    @accumulator = 0
  end

  def step
    new_index, new_acc = @instructions[@current_index].execute(self)
    @current_index = new_index
    @accumulator = new_acc
  end
end
