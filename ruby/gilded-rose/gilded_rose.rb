Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each { |item|
      q = item.quality
      conjured = item.name =~ /conjured/i
      old = item.sell_in <= 0
      sulfuras = item.name =~ /sulfuras/i
      next if sulfuras and !conjured

      case item.name
      when /backstage/i
        q += 1
        q += 1 if item.sell_in < 11
        q += 1 if item.sell_in < 6
        q -= 1 if conjured
        q = 0 if old
      when /sulfuras/i
        q = 0 if old
      when /brie/i
          q += old ? 2 : 1
      else
        q -= (conjured || old) ? 2 : 1
      end
      q = 0 if conjured && old
      item.sell_in -= 1
      item.quality = sulfuras ? q : q.clamp(0,50)
    }
  end
end
