module SavingsAccount
  def self.interest_rate(balance)
    balance < 0 ? 3.213 : balance < 1000 ? 0.5 : balance < 5000 ? 1.621 : 2.475
  end

  def self.annual_balance_update(balance)
    balance + (balance * SavingsAccount.interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while 1
      years += 1
      current_balance = SavingsAccount.annual_balance_update(current_balance)
      if current_balance >= desired_balance
        return years
      end
    end
  end
end

puts SavingsAccount.annual_balance_update(1_000.0)
