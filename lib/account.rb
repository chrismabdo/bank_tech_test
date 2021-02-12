# frozen_string_literal: false

require_relative './statement'
require_relative './transaction'
require 'date'

# this class holds information pertaining to a users' account, allows deposits, withdrawls and printing statements
class Account
  attr_reader :history, :transaction, :balance
  attr_accessor :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  # Trying to withdraw the dependency of Account on Transaction
  def deposit(amount, transaction = Transaction.new)
    @transaction = transaction
    @transaction.debit(amount)
    @balance += amount
    @transaction.log << format('%.2f', @balance)
    @statement.history.push(transaction.log)
  end

  def withdraw(amount, transaction = Transaction.new)
    @transaction = transaction
    @transaction.credit(amount)
    @balance -= amount
    @transaction.log << format('%.2f', @balance)
    @statement.history.push(transaction.log)
  end
  # deposit and withdraw methods a bit clunky, even though transaction was extracted to a separate class.

  def print_statement
    @statement.format_transactions
  end
end
