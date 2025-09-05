class Say
  DIGITS = %w[zero one two three four five six seven eight nine]
  TEENS = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  TENS = %w[zero ten twenty thirty forty fifty sixty seventy eighty ninety]
  ORDERS = {
    1_000_000_000 => "billion",
    1_000_000     => "million",
    1000          => "thousand",
    100           => "hundred",
  }

  def initialize(number)
    @number = number
  end

  def in_english
    throw ArgumentError if @number > 999_999_999_999 or @number < 0
    return "zero" if @number == 0
    out = []
    ORDERS.each_with_index { |(order, label), i|
      cnt = @number / order
      has_100 = false
      if cnt >= 100
        hundreds = cnt / 100
        out << up_to_100(hundreds) + " hundred"
        cnt -= hundreds * 100
        @number -= hundreds * 100 * order
        has_100 = true
      end

      out << up_to_100(cnt) if cnt > 0
      if has_100 or cnt > 0
        out << label
        @number -= cnt * order
      end
    }
    out << up_to_100(@number) if @number > 0
    out.join(" ")
  end

  def up_to_100(num)
    out = []
    has_tens = false

    if num >= 20
      how_many = num / 10
      out << TENS[how_many]
      num -= 10 * how_many
      has_tens = true
    end

    if num >= 10
      out << TEENS[num - 10]
      num = 0
    end

    if num > 0
      out << "-" if has_tens
      out << DIGITS[num]
    end

    out.join
  end
end
