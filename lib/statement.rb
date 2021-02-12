# frozen_string_literal: false

require_relative './account'
require_relative './transaction'

# This class is responsible for printing the user's account history in a formatted statement
class Statement
  attr_accessor :history

  def initialize
    @history = []
  end

  def format_transactions
    result = @history.reverse.map do |t|
      "#{t[0]}||#{t[1]}#{t[2]}||#{t[3]}"
    end
    print "   date   || credit || debit || balance\n#{result.join("\n")}"
  end
end
