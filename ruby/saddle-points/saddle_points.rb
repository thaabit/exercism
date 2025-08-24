class Grid
  def self.saddle_points(input)
    cols = input.transpose
    out = []
    input.each_with_index do |row, y|
      max_in_row = row.max
      row.each_with_index do |el, x|
        if el == max_in_row
          min_in_col = cols[x].min
          if el == min_in_col
            out.append({
              "row"    => y + 1,
              "column" => x + 1,
            })
          end
        end
      end
    end
    return out
  end
end
