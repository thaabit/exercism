FLOWER = '*'

class FlowerField
  def self.annotate(input)

    return [] if input.empty?

    width, height = input[0].length, input.length
    dirs = [0,1,-1].repeated_permutation(2)

    input.each_with_index { |row, y|
      row.chars.each_with_index { |square, x|

        next if square == FLOWER

        input[y][x] = dirs.select { |dir|
          xx, yy = x + dir[0], y + dir[1]
          in_the_garden = (xx >= 0 and yy >= 0 and yy < height and xx < width)
          in_the_garden and input[yy][xx] == FLOWER
        }.size.to_s.sub("0"," ")
      }
    }
  end
end
