require 'account'

describe Account do
    before(:each) do
        @account = Account.new
      end
    
    it 'will be an instance of Account' do
        expect(@account).to be_kind_of Account 
    end

    it 'will respond to a deposit method' do
        expect(@account).to respond_to(:deposit).with(1).argument
    end

    
end