require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:account) { Account.new }
  it 'will be an instance of statement' do
    expect(subject).to be_an_instance_of Statement
  end

  it 'will have a format transactions method' do
    expect(subject).to respond_to(:format_transactions)
  end

  it 'will keep records of debits and credits' do
    expect(subject.history).to eq []
  end

  describe '#print_statement' do
    before(:each) do
      allow(Date).to receive(:today).and_return Date.new(2021, 2, 8)
    end
    it 'will print a statement containing one transaction' do
      account.deposit(50)
      expect do
        account.print_statement
      end.to output("   date   || credit || debit || balance\n2021-02-08||||50.00||50.00").to_stdout
    end

    it 'will print a statement with each transaction on separate lines' do
      account.deposit(50)
      account.deposit(20)
      expect do
        account.print_statement
      end.to output("   date   || credit || debit || balance\n2021-02-08||||20.00||70.00\n2021-02-08||||50.00||50.00").to_stdout
    end

    it 'will print a statement with transactions in reverse chronological order' do
      account.deposit(50)
      account.deposit(20)
      account.deposit(100)
      expect do
        account.print_statement
      end.to output("   date   || credit || debit || balance\n2021-02-08||||100.00||170.00\n2021-02-08||||20.00||70.00\n2021-02-08||||50.00||50.00").to_stdout
    end

    it 'will handle both deposits and withdrawls' do
      account.deposit(50)
      account.withdraw(20)
      expect do
        account.print_statement
      end.to output("   date   || credit || debit || balance\n2021-02-08||20.00||||30.00\n2021-02-08||||50.00||50.00").to_stdout
    end
  end
end
