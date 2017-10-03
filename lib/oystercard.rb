# :nodoc:
class Oystercard
  attr_reader :balance, :in_journey, :entry_station
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance = #{MAXIMUM_LIMIT}" \
      if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in station
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @in_journey = false 
  end

  private

  def deduct(amount)
    raise 'Not enough balance' if @balance < MINIMUM_FARE
    @balance -= amount
  end
end
