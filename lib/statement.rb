require_relative './account'
require_relative './transaction'

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
