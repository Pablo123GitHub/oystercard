require 'oystercard'

describe Oystercard do
  let(:oystercard) { described_class }
  describe '#initialize'
  it "creates a new Oystercard object with a 'balance' instance variable = 0" do
    expect(subject.balance).to eq 0
  end
end
