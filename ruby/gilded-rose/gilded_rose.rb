Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    is_conjured = item.match?(/conjured/i)
    is_sulfuras = item.match?(/sulfuras/i)
    is_backstage = item.match?(/backstage/i)
    is_brie = item.match?(/brie/i)
    @items.each { |item|
      old = item.sell_in <= 0
      modifier = -1
      if is_backstage
        modifier = 1
        modifier += 1 if sell_in < 11
        modifier += 1 if sell_in < 6
        modifier  = 0 if sell_in < 1
      elsif is_brie
        modifier = old ? 0 : 1
      elsif is_sulfuras
        modifier = is_conjured ? -1 : 1
      else
        modifier -= 1 if is_conjured
      end
      modifier = 0 if is_conjured and sell_in < 1

      item.quality += 1 * modifier if is_brie || is_backstage
      item.quality -= 1 unless is_sulfuras && !is_conjured
      item.sell_in -= 1 unless is_sulfuras && !is_conjured
    }
  end
end
