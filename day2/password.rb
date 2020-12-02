class Password
  attr_reader :start_num
  attr_reader :end_num
  attr_reader :password
  attr_reader :required_char

  def initialize(policy_and_password)
    @start_num = policy_and_password[/\d+/].to_i
    @end_num = policy_and_password[/-\d+/][/\d+/].to_i
    @password = policy_and_password[/: \w+/][/\w+/]
    @required_char = policy_and_password[/\w:/][/\w/]
  end

  def valid?
    true
  end
end
