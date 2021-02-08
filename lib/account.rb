# frozen_string_literal: false

# this class holds information pertaining to a users' account, allows deposits, withdrawls and printing statements
class Account
  attr_reader :balance, :credit, :debit

  def initialize
    @balance = 0
    @credit = []
    @debit = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
