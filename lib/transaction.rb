require 'date'
# frozen_string_literal: false

# this class holds information pertaining to a single transaction, feeding information into deposits and withdrawls.
class Transaction
  attr_reader :log
    def initialize
      @log = []
    end

    def debit(amount)
      add_current_date
      @log << "     ||   "
      @log << amount
    end

    def credit(amount)
      add_current_date
      @log << amount
      @log << "   ||      "
    end
# Not ideal adding the whitespaces on lines 13 and 20. Chose to add them for clearer readability in the printed statement.
private

    def add_current_date
      @date = Date.today.to_s
      @log << @date
    end
end