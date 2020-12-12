class WaitingArea
  def initialize(str)
    @str = str
    @states = [str]
  end

  def tick
    @states << next_state
  end

  def state
    @states.last
  end

  def stable?
    @states.last == @states[-2]
  end

  def occupied_seat_count
    state_array.reduce(0) do |sum, row|
      sum + row.count do |seat|
        seat == "#"
      end
    end
  end

  private

  def state_array
    state.split("\n")
         .map { |row| row.chars }
  end

  def next_state
    arr = state_array
    arr.each_with_index.map do |row, y|
      row.each_with_index.map do |item, x|
        case item
        when "L"
          if adjacent_occupied_seats(arr, y, x).empty?
            "#"
          else
            "L"
          end
        when "#"
          if adjacent_occupied_seats(arr, y, x).size >= 4
            "L"
          else
            "#"
          end
        else
          item
        end
      end
    end.map(&:join).join("\n")
  end

  def adjacent_occupied_seats(arr, y, x)
    [
     [0, 1], [1, 1], [1, 0], [1, -1],
     [0, -1], [-1, -1], [-1, 0], [-1, 1]
    ].map do |(delta_y, delta_x)|
      access_y = y + delta_y
      access_x = x + delta_x

      next nil if [access_y, access_x].any?(&:negative?)

      arr[y + delta_y] && arr[y + delta_y][x + delta_x]
    end.select { |item| item == "#" }
  end
end
