Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each { |item|
      p item
      name, quality, sell_in = item.name, item.quality, item.sell_in
      p [name, quality, sell_in]
      conjured = name.match?(/conjured/i)
      is_sulfuras = name.match?(/sulfuras/i)
      is_backstage = name.match?(/backstage/i)
      brie = name.match?(/brie/i)
      selltoday = sell_in == 0
      old = sell_in < 0
      modifier = -1
      quality = 0 if conjured && (old || (selltoday && !brie))
      quality = 0 if is_backstage && (selltoday || old)
      worthless = quality == 0
      p [brie, worthless, conjured]
      if is_backstage && !selltoday && !old
        modifier = 1
        modifier += 1 if sell_in < 11
        modifier += 1 if sell_in < 6
        modifier -= 1 if conjured
      elsif is_sulfuras
        modifier = 0
      elsif brie && !(worthless && conjured)
        p "brie"
          modifier = old ? 2 : 1
      else
        modifier -= 1 if conjured || selltoday || old
      end
      p modifier

      p quality
      quality += modifier unless is_sulfuras && !conjured
      quality = 50 if quality > 50 && !is_sulfuras
      quality = 0 if quality < 0

      sell_in -= 1 unless is_sulfuras && !conjured
      p quality
      item.quality = quality
      item.sell_in = sell_in
    }
  end
end
p GildedRose.new([Item.new("conjured brie", 0, 1)]).update!
