require 'transaction'
require 'account'

describe Transaction do
  let(:transaction) { described_class.new }
  let(:account) { Account.new }

  it 'will be an instance of Transaction' do
    expect(transaction).to be_kind_of Transaction
  end

  it 'will create an empty log' do
    expect(transaction.log).to eq []
  end

  it 'will add three elements to the log: date, amount, balance' do
    account.deposit(50)
    expect(transaction.log.length).to eq 3
  end

# it 'will contain a date for a deposit or withdrawl' do
    #     date = double("2021-02-08")
    #     allow(account).to receive(:add_current_date).and_return(date)
    #   end

#   it 'will add a transaction to debit' do
    
#   end
end