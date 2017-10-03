# :nodoc:
class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :history
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  def initialize
    @balance = 0
    @history = []
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

  def touch_out station
    deduct(MINIMUM_FARE)
    @history <<  { :entry_station => @entry_station, :exit_station => station }
    @entry_station = nil
    @in_journey = false
  end

  private

  def deduct(amount)
    raise 'Not enough balance' if @balance < MINIMUM_FARE
    @balance -= amount
  end
end
