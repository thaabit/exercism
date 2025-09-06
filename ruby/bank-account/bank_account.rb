class BankAccount
  @open = false

  def open
    raise ArgumentError if @open
    @balance = 0
    @open = true
  end

  def close
    raise ArgumentError unless @open
    @open = false
  end

  def balance
    raise ArgumentError unless @open
    @balance
  end

  def deposit(amount)
    raise ArgumentError unless @open
    raise ArgumentError if amount < 0
    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError unless @open
    raise ArgumentError if amount > balance or amount < 0
    @balance -= amount
  end
end
