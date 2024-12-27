require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test

  def test_calculate
    assert_nil StringCalculator.calculate, nil
  end
end
