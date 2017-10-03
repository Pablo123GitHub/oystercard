require './lib/oystercard'

describe "deduc the right fare" do
  oystercard = Oystercard.new
  oystercard.top_up(75)
  # oystercard.touch_in "Liverpool Street"
  # oystercard.touch_out "Seven Sisters"
  p oystercard.history

end
