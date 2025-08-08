class BankAccount:
    def __init__(self):
        self.balance = 0
        self.opened = False

    def get_balance(self):
        if not self.opened: raise ValueError('account not open')
        return self.balance

    def open(self):
        if self.opened: raise ValueError('account already open')
        self.opened = True

    def deposit(self, amount):
        if not self.opened: raise ValueError('account not open')
        if amount < 0: raise ValueError('amount must be greater than 0')
        self.balance += amount

    def withdraw(self, amount):
        if not self.opened: raise ValueError('account not open')
        if amount < 0: raise ValueError('amount must be greater than 0')
        if amount > self.balance: raise ValueError('amount must be less than balance')
        self.balance -= amount

    def close(self):
        if not self.opened: raise ValueError('account not open')
        self.opened = False
        self.balance = 0
