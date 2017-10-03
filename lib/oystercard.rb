# :nodoc:
class Oystercard
  attr_reader :balance, :in_journey, :entry_station
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance = #{MAXIMUM_LIMIT}" \
      if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in station
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
    raise 'Not enough balance' if @balance < MINIMUM_FARE
    @balance -= amount
  end
end
