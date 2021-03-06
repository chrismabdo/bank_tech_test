# frozen_string_literal: false

require_relative './account'
require_relative './statement'
require 'date'

# this class holds information pertaining to a single transaction, feeding information into deposits and withdrawls.
class Transaction
  attr_reader :log

  def initialize
    @log = []
  end

  def debit(amount)
    add_current_date
    @log.push('||', monetary_conversion(amount))
  end

  def credit(amount)
    add_current_date
    @log.push(monetary_conversion(amount), '||')
  end

  private

  def add_current_date
    date = Date.today.to_s
    @log << date
  end

  def monetary_conversion(amount)
    format('%.2f', amount)
  end
end
