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
end