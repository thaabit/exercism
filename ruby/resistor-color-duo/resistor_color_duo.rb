class ResistorColorDuo
  ORDER = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    (ORDER.find_index(colors[0]).to_s + ORDER.find_index(colors[1]).to_s).to_i
  end

end
