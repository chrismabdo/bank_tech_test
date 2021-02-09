require_relative './transaction'
require 'date'
# frozen_string_literal: false

# this class holds information pertaining to a users' account, allows deposits, withdrawls and printing statements
class Account
  attr_reader :balance, :history, :transaction

  def initialize
    @balance = 0
    @history = []
  end
# Trying to withdraw the dependency of Account on Transaction
  def deposit(amount, transaction = Transaction.new)
    @transaction = transaction
    @transaction.debit(amount)
    @balance += amount
    @transaction.log << @balance
    @history.push(transaction.log)
  end

  def withdraw(amount, transaction = Transaction.new)
    @transaction = transaction
    @transaction.credit(amount)
    @balance -= amount
    @transaction.log << @balance
    @history.push(transaction.log)
  end
# deposit and withdraw methods a bit clunky, which is why I extracted to a separate class.. Still could be slimmed down.
  def print_statement
    result = @history.reverse.map do |t| 
      t[0] + " ||   " + t[1].to_s + t[2].to_s + " || " + t[3].to_s 
    end
    print "   date    || credit || debit || balance\n#{result.join("\n")}" 
  end
end
