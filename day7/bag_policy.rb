class BagPolicy
  def initialize(str)
    @str = str
  end

  def can_directly_contain?(bag_type, policies: [])
    containable_bag_types.include? bag_type
  end

  def containable_bag_types
    @str.scan(/\d+ (.+?) bag/).flatten
  end

  def bag_type
    @str.scan(/^(.+?) bags/).flatten.first
  end

  def bag_counts
    @str.scan(/(\d+) (.+?) bag/).map do |count, color|
      { count: count.to_i, color: color }
    end
  end
end
