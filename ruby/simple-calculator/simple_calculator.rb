class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    begin
      if not first_operand.is_a? Integer or not second_operand.is_a? Integer
        raise ArgumentError.new("Invalid argument") 
      end
      if not ALLOWED_OPERATIONS.include? operation
        raise UnsupportedOperation.new("Invalid operation") 
      end

      result = first_operand.method(operation).(second_operand)
      return "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError => e
      return "Division by zero is not allowed."
    end
  end
end
