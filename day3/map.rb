class Map
  def initialize(str)
    rows = str.split("\n")
    column_count = rows[0].length
    @columns = column_count.times.map do |i|
      rows.map { |row| row[i] }
    end
  end

  def [](x)
    @columns[x % @columns.length]
  end
end
