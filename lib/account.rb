require_relative './transaction'
require 'date'
# frozen_string_literal: false

# this class holds information pertaining to a users' account, allows deposits, withdrawls and printing statements
class Account
  attr_reader :balance, :credit, :debit, :transaction

  def initialize
    @balance = 0
    @credit = []
    @debit = []
  end

  def deposit(amount)
    @transaction = Transaction.new
    @transaction.debit(amount)
    @balance += amount
    @transaction.log << @balance
    @debit.push(transaction.log)
  end

  def withdraw(amount)
    @balance -= amount
  end

end
