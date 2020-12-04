require_relative 'passport'

class Batch
  def initialize(str_input)
    @str_input = str_input
  end

  def passports
    @str_input.split(/^$/).map(&Passport.method(:new))
  end
end
