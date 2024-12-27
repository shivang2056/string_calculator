require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test

  def test_calculate
    assert_nil calculate
    assert_nil calculate(12)

    assert_equal calculate(''), 0

    assert_equal calculate('1'), 1
    assert_equal calculate('1,5'), 6
  end

  private

  def calculate(string = nil)
    StringCalculator.calculate(string)
  end
end
