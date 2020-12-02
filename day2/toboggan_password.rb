require_relative 'password'

class TobogganPassword < Password
  def valid?
    [start_num, end_num].count { |i| password[i - 1] == required_char } == 1
  end
end
