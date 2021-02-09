# frozen_string_literal: false

require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'will be an instance of Account' do
    expect(subject).to be_kind_of Account
  end

  it 'will be initialized with an empty balance' do
    expect(subject.balance).to eq 0
  end

  it 'will keep records of debits and credits' do
    expect(subject.history).to eq []
  end

  describe '#depositing_funds' do
    it 'will respond to a deposit method' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'will deposit funds to the account balance' do
      subject.deposit(50)
      expect(subject.balance).to eq 50
    end
  end

  describe '#withdrawing_funds' do
    it 'will respond to a withdraw method' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    it 'will withdraw funds from the account, and this will be shown in the balance' do
      subject.deposit(50)
      subject.withdraw(10)
      expect(subject.balance).to eq 40
    end
  end

  describe '#print_statement' do
    before(:each) do
      allow(Date).to receive(:today).and_return Date.new(2021, 2, 8)
    end
    it 'will print a statement containing one transaction' do
      subject.deposit(50)
      expect do
        subject.print_statement
      end.to output("   date    || credit || debit || balance\n2021-02-08 ||      ||   50.00 || 50.00").to_stdout
    end

    it 'will print a statement with each transaction on separate lines' do
      subject.deposit(50)
      subject.deposit(20)
      expect do
        subject.print_statement
      end.to output("   date    || credit || debit || balance\n2021-02-08 ||      ||   20.00 || 70.00\n2021-02-08 ||      ||   50.00 || 50.00").to_stdout
    end

    it 'will print a statement with transactions in reverse chronological order' do
      subject.deposit(50)
      subject.deposit(20)
      subject.deposit(100)
      expect do
        subject.print_statement
      end.to output("   date    || credit || debit || balance\n2021-02-08 ||      ||   100.00 || 170.00\n2021-02-08 ||      ||   20.00 || 70.00\n2021-02-08 ||      ||   50.00 || 50.00").to_stdout
    end

    it 'will handle both deposits and withdrawls' do
      subject.deposit(50)
      subject.withdraw(20)
      expect do
        subject.print_statement
      end.to output("   date    || credit || debit || balance\n2021-02-08 || 20.00  ||       || 30.00\n2021-02-08 ||      ||   50.00 || 50.00").to_stdout
    end
  end
end
