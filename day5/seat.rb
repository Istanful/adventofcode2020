class Seat
  def initialize(str, row_count: 128, col_count: 8)
    @str = str
    @row_count = row_count
    @col_count = col_count
  end

  def row
    row_chars.inject((0..@row_count - 1).to_a) do |rows, char|
      next rows[0..rows.length / 2] if char == "F"

      rows[rows.length / 2..rows.length - 1]
    end.first
  end

  def column
    col_chars.inject((0..@col_count).to_a) do |cols, char|
      next cols[0..cols.length / 2] if char == "L"

      cols[cols.length / 2..cols.length - 1]
    end.first
  end

  def seat_id
    row * 8 + column
  end

  private

  def row_chars
    @str[0..6].chars
  end

  def col_chars
    @str[-3..-1].chars
  end
end
