class Grid
  def self.saddle_points(rows)
    cols = rows.transpose
    out = []
    rows.each_with_index do |row, y|
      row.each_with_index do |height, x|
        out.append({
          "row"    => y + 1,
          "column" => x + 1,
        }) if height == row.max and height == cols[x].min
      end
    end
    return out
  end
end
