class Instruction
  OPERATIONS = {
    nop: ->(program, arg) { [program.current_index + 1, program.accumulator] },
    acc: ->(program, arg) { [program.current_index + 1, program.accumulator + arg] },
    jmp: ->(program, arg) { [program.current_index + arg, program.accumulator] },
  }

  def initialize(str)
    @str = str
  end

  def execute(program)
    OPERATIONS[operation].call(program, argument)
  end

  def swap_operation(swappable)
    new_operation = (swappable - [operation]).first
    new_str = "#{new_operation} #{argument}"
    @str = new_str
  end

  def operation
    @str[0..2].to_sym
  end

  private

  def argument
    @str[/-?\d+/].to_i
  end
end
