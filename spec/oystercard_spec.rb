require 'oystercard'

describe Oystercard do
  let(:liverpool_street) { double(name: 'Liverpool Street') }
  let(:seven_sisters) { double(name: 'Seven Sisters') }
  it "creates a new Oystercard object with a 'balance' instance variable = 0" do
    expect(subject.balance).to eq 0
  end
  it 'tops up an oystercard by a specific amount will add amount to balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.by(5)
  end
  it 'tops up an oyster beyond the maximum limit' do
    maximum_balance = Oystercard::MAXIMUM_LIMIT
    subject.top_up(maximum_balance)
    expect { subject.top_up(1) }.to \
      raise_error(RuntimeError, "Maximum balance = #{maximum_balance}")
  end
  it 'expects the oystercard to respond to :touch_in' do
    expect(subject).to respond_to(:touch_in)
  end
  it 'expects in_journey == true once touch_in is used' do
    subject.touch_in liverpool_street
    expect(subject.in_journey).to eq true
  end
  it 'expects in_journey == false once touch_out is used' do
    subject.top_up(10)
    subject.touch_in liverpool_street
    subject.touch_out seven_sisters
    expect(subject.in_journey).to eq false
  end

  it 'stops you using your card if balance is too low' do
    expect { subject.touch_out liverpool_street }.to raise_error \
    'Not enough balance'
  end

  it 'deducts MINIMUM_FARE when touch_out is used' do
    subject.top_up(10)
    expect { subject.touch_out liverpool_street }.to change \
    { subject.balance }.by(-1)
  end

  it 'is possible to touch_in at a specific station' do
    subject.top_up 10
    subject.touch_in liverpool_street
    expect(subject.entry_station).to eq liverpool_street
  end

  it 'set entry_station to nil upon touch_out' do
    subject.top_up(10)
    subject.touch_in liverpool_street
    subject.touch_out seven_sisters
    expect(subject.entry_station).to be_nil
  end

  it 'has a history variable that defaults to an empty array' do
    expect(subject.history).to match_array []
  end

  it 'has a history of one journey after touching in and out' do
    subject.top_up 10
    subject.touch_in liverpool_street
    expect { subject.touch_out seven_sisters }.to change \
    { subject.history.length }.by(1)
  end

context 'touching in and out through one journey'
let(:card) { Oystercard.new }
  before(:each) do
   card.top_up(10)
   card.touch_in liverpool_street
   card.touch_out seven_sisters
  end
  it 'saves the correct entry station in journey history' do
    expect(card.history[0][:entry_station]).to eq liverpool_street
  end

  it 'saves the correct exit_station in journey history' do
    expect(card.history[0][:exit_station]).to eq seven_sisters
  end
end
