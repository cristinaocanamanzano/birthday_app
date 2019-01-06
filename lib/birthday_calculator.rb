require "date"

class BirthdayCalculator
  def initialize(day, month)
    @day = day
    @month = month
  end

  def birthday_today?
    birthday_date == today
  end

  private

  def today
    Date.today
  end

  def birthday_date
    Date.parse("#{@day} #{@month}")
  end
end
