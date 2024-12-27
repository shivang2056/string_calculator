require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test

  def test_calculate
    assert_nil calculate
    assert_nil calculate(12)

    assert_equal 0, calculate('')

    assert_equal 1, calculate('1')
    assert_equal 6, calculate('1,5')
    assert_equal 306, calculate('1,5,4, 2,   54,   122   , 21 , 11,32,54 ')

    assert_equal 6, calculate("1\n2,3")
    assert_equal 274, calculate("1,5\n4, 2,   54\n   122   , 21 \n 11,54 ")
  end

  private

  def calculate(string = nil)
    StringCalculator.new(string).calculate
  end
end
