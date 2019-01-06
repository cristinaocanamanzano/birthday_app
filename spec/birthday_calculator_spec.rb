require "./lib/birthday_calculator"
require "timecop"

describe BirthdayCalculator do
  let(:birthday_calculator) { described_class.new(3, "October")}

  describe "#birthday_today?" do
    it "returns true if birthday is today" do
      Timecop.freeze(Time.parse('3 October')) do
        expect(birthday_calculator.birthday_today?).to be true
      end
    end

    it "returns false if birthday is not today" do
      Timecop.freeze(Time.parse('2 October')) do
        expect(birthday_calculator.birthday_today?).to be false
      end
    end
  end
end
