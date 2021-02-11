# frozen_string_literal: false

require 'account'

describe Account do
  let(:account) { described_class.new }
  let(:statement) { Statement.new }
  it 'will be an instance of Account' do
    expect(subject).to be_kind_of Account
  end

  it 'will be initialized with an empty balance' do
    expect(subject.balance).to eq 0
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
end
