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

describe '#depositing_funds' do

  it 'will keep records of debit' do
    expect(account.debit).to eq []
  end

  it 'will respond to a deposit method' do
    expect(account).to respond_to(:deposit).with(1).argument
  end

  it 'will deposit funds to the account balance' do
    account.deposit(50)
    expect(account.balance).to eq 50
  end
end

describe '#withdrawing_funds' do
    
  it 'will keep records of credit' do
    expect(account.credit).to eq []
  end

  it 'will respond to a withdraw method' do
    expect(account).to respond_to(:withdraw).with(1).argument
  end

  it 'will withdraw funds from the account, and this will be shown in the balance' do
    account.deposit(50)
    account.withdraw(10)
    expect(account.balance).to eq 40
  end
end



end
