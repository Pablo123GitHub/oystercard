require 'oystercard'

describe Oystercard do
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
    it 'deducts money from the oystercard' do
    subject.top_up(50)
    expect { subject.deduct(1) }.to change { subject.balance }.from(50).to(49)
  end
    it 'expects the oystercard to respond to :touch_in' do
      expect(subject).to respond_to(:touch_in)
    end
  it 'expects the oystercard to show in_journey == true once touch_in is used' do
    subject.touch_in
    expect(subject.in_journey).to eq true
  end
  it 'expects the oystercard to show in_journey == false once touch_out is used' do
      subject.touch_out
      expect(subject.in_journey).to eq false
  end
end
