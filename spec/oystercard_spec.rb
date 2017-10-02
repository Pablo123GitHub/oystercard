require 'oystercard'

describe Oystercard do
  let(:oystercard) { described_class }
  describe '#initialize'
  it "creates a new Oystercard object with a 'balance' instance variable = 0" do
    expect(subject.balance).to eq 0
  end
  describe '#top_up'
  it 'tops up an oystercard by a specific amount will add amount to balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.by(5)
  end
end
