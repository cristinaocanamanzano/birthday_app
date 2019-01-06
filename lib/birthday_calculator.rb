require "date"

class BirthdayCalculator
  def initialize(day, month)
    @day = day
    @month = month
  end

  def birthday_today?
    birthday_date == today
  end

  def countdown
    birthday_already? ? 365 + days_difference : days_difference
  end

  private

  def today
    Date.today
  end

  def birthday_date
    Date.parse("#{@day} #{@month}")
  end

  def days_difference
    (birthday_date - today).to_i
  end

  def birthday_already?
   birthday_date < today
 end
end
