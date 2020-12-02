require_relative 'password'

class SledRentalPassword < Password
  def valid?
    required_char_count >= start_num && required_char_count <= end_num
  end

  def required_char_count
    password.count(required_char)
  end
end
