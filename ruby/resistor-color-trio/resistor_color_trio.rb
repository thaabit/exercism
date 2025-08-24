class ResistorColorTrio
  ORDER = %w[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    @colors = colors
  end

  def digit(index)
    ORDER.index(@colors[index])
  end

  def label
    value = [digit(0), digit(1)].join.to_i * 10 ** digit(2)

    units = value > 1000 ? "kiloohms" : "ohms"
    value /= 1000 if value > 1000

    return "Resistor value: #{value} #{units}"
  end
end
