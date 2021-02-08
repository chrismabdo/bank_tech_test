require 'date'

class Transaction
  attr_reader :log
    def initialize
      @log = []
    end

    def record(amount)
      add_current_date
      @log << amount
    end

private

    def add_current_date
      @date = Date.today.to_s
      @log << @date
    end
end