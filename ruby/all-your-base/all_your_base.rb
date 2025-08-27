class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2 or output_base < 2

    base10 = digits.reverse.each_with_index.reduce(0) { |agg, (digit, index)|
      raise ArgumentError if digit < 0 || digit >= input_base
      agg + digit * input_base**index
    }

    out = []
    while base10 > 0
      out << base10 % output_base
      base10 /= output_base
    end
    return out.empty? ? [0] : out.reverse
  end
end
