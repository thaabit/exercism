class ResistorColorTrio
  @@order = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @colors = colors
  end

  def label
    one = @@order.find_index(@colors[0])
    two = @@order.find_index(@colors[1])
    zeroes = "0" * @@order.find_index(@colors[2])

    value = "#{one}#{two}#{zeroes}".to_i
    units = "ohms"
    if value > 1000
        value = value / 1000
        units = "kiloohms"
    end
    return "Resistor value: #{value} #{units}"
  end
end
