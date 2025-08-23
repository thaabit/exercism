class FlattenArray
  def self.flatten(unflat)
    out = []
    flattenize = ->(e) {
      e.kind_of?(Array) ? e.each { |e| flattenize.call(e) } : out.append(e) unless e.nil?
    }
    flattenize.call(unflat)
    return out
  end
end
