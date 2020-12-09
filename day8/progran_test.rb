require 'minitest/autorun'
require_relative 'program'
require_relative 'instruction'

class ProgramTest < MiniTest::Test
  def test_step_executes_noop
    program = Program.new([
      Instruction.new('nop +10')
    ])

    program.step

    assert_equal 1, program.current_index
  end

  def test_step_executes_acc
    program = Program.new([
      Instruction.new('acc +1')
    ])

    program.step

    assert_equal 1, program.accumulator
  end

  def test_step_executes_jmp
    program = Program.new([
      Instruction.new('jmp +4')
    ])

    program.step

    assert_equal 4, program.current_index
  end
end
