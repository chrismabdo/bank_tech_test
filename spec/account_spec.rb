# frozen_string_literal: false

require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'will be an instance of Account' do
    expect(account).to be_kind_of Account
  end

  it 'will be initialized with an empty balance' do
    expect(account.balance).to eq 0
  end

  it 'will keep records of debits and credits' do
    expect(account.history).to eq []
  end

describe '#depositing_funds' do
  it 'will respond to a deposit method' do
    expect(account).to respond_to(:deposit).with(1).argument
  end

  it 'will deposit funds to the account balance' do
    account.deposit(50)
    expect(account.balance).to eq 50
  end
end

describe '#withdrawing_funds' do
  it 'will respond to a withdraw method' do
    expect(account).to respond_to(:withdraw).with(1).argument
  end

  it 'will withdraw funds from the account, and this will be shown in the balance' do
    account.deposit(50)
    account.withdraw(10)
    expect(account.balance).to eq 40
  end
end

describe '#print_statement' do
  before(:each) do
    allow(Date).to receive(:today).and_return Date.new(2021,2,8)
  end
  it 'will print a statement containing one transaction' do
    account.deposit(50)
    expect{ account.print_statement }.to output("   date    || credit || debit || balance\n2021-02-08 ||        ||   50 || 50").to_stdout
  end

  it 'will print a statement with each transaction on separate lines' do
    account.deposit(50)
    account.deposit(20)
    expect{ account.print_statement }.to output("   date    || credit || debit || balance\n2021-02-08 ||        ||   20 || 70\n2021-02-08 ||        ||   50 || 50").to_stdout
  end

  it 'will print a statement with transactions in reverse chronological order' do
    account.deposit(50)
    account.deposit(20)
    account.deposit(100)
    expect{ account.print_statement }.to output("   date    || credit || debit || balance\n2021-02-08 ||        ||   100 || 170\n2021-02-08 ||        ||   20 || 70\n2021-02-08 ||        ||   50 || 50").to_stdout
  end

  it 'will handle both deposits and withdrawls' do
    account.deposit(50)
    account.withdraw(20)
    expect{ account.print_statement }.to output("   date    || credit || debit || balance\n2021-02-08 ||   20   ||       || 30\n2021-02-08 ||        ||   50 || 50").to_stdout
  end
end
end
