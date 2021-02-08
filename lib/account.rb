require_relative './transaction'
require 'date'
# frozen_string_literal: false

# this class holds information pertaining to a users' account, allows deposits, withdrawls and printing statements
class Account
  attr_reader :balance, :credit, :debit, :transaction

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @transaction = Transaction.new
    @transaction.debit(amount)
    @balance += amount
    @transaction.log << @balance
    @history.push(transaction.log)
  end

  def withdraw(amount)
    @transaction = Transaction.new
    @transaction.credit(amount)
    @balance -= amount
    @transaction.log << @balance
    @history.push(transaction.log)
  end

  def print_statement
    result = @history.reverse.map do |t| 
      t[0] + " || " + t[1].to_s + t[2].to_s + " || " + t[3].to_s 
    end

    print "   date    || credit || debit || balance\n#{result.join("\n")}" 
    
  end
end
