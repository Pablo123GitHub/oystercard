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
  it 'tops up an oyster beyond the maximum limit' do
    maximum_balance = Oystercard::MAXIMUM_LIMIT
    subject.top_up(maximum_balance)
    expect { subject.top_up(1) }.to \
      raise_error(RuntimeError, "Maximum balance = #{maximum_balance}")
  end
end
