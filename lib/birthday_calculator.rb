require "date"

class BirthdayCalculator
  def initialize(day, month)
    @day = day
    @month = month
  end

  def birthday_today?
    birthday_date == Date.today
  end

  private

  def birthday_date
    Date.parse("#{@day} #{@month}")
  end
end
