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

  private

  def operation
    @str[0..2].to_sym
  end

  def argument
    @str[/-?\d+/].to_i
  end
end
