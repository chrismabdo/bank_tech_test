require 'statement'

describe Statement do
    let(:statement) { described_class.new }
    
    it 'will be an instance of statement' do
      expect(subject).to be_an_instance_of Statement
    end

    it 'will have a print method' do
      expect(subject).to respond_to(:print)
    end
end