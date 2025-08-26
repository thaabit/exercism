class BinarySearch
  def initialize(numbers)
    @numbers = numbers
  end

  def search_for(number, start_index=0, end_index=@numbers.length - 1)
    return nil if start_index > end_index

    middle_index = (start_index + end_index) / 2
    middle_value = @numbers[middle_index]
    return middle_index if middle_value == number

    return search_for(number, middle_index + 1, end_index) if number > middle_value
    return search_for(number, start_index, middle_index - 1)
  end
end
