class Palindromes

  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor:1)
    raise ArgumentError, "min must be <= max" if min_factor > max_factor

    @max_factor = max_factor
    @min_factor = min_factor
    @largest = Outputter.new()
    @smallest = Outputter.new()
  end

  def generate
    done = false
    (@min_factor..@max_factor).each { |x|
      break if done
      (x..@max_factor).each { |y|
        value = x * y
        if value.to_s == value.to_s.reverse
          if !smallest.value || value < smallest.value
            smallest.value = value
            smallest.factors = [[x,y]]
          elsif value == smallest.value
            smallest.facors << [x,y]
          end
          if smallest.value and x**2 > smallest.value
            done = true
            break
          end
        end
      }
    }

    done = false
    (@min_factor..@max_factor).reverse_each { |y|
      break if done
      (@min_factor..y).reverse_each { |x|
        value = x * y
        if value.to_s == value.to_s.reverse
          if !largest.value || value > largest.value
            largest.value = value
            largest.factors = [[x,y]]
          elsif value == largest.value
            largest.factors << [x,y]
          end
          if largest.value and y**2 < largest.value
            done = true
            break
          end
        end
      }
    }
    return self
  end
end
class Outputter
  attr_accessor :value, :factors
  def initialize(value:nil, factors:[])
    @value = value
    @factors = factors
  end
end
