require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test

  def test_add
    assert_nil add
    assert_nil add(12)

    assert_equal 0, add('')

    assert_equal 1, add('1')
    assert_equal 6, add('1,5')
    assert_equal 306, add('1,5,4, 2,   54,   122   , 21 , 11,32,54 ')

    assert_equal 6, add("1\n2,3")
    assert_equal 274, add("1,5\n4, 2,   54\n   122   , 21 \n 11,54 ")

    assert_equal 3, add("//;\n1;2")
    assert_equal 301, add("//:\n1:4: 2:   54\n   122   : 21 : 11 \n32:54 ")

    error = assert_raises(Exception) { add("1\n-2,3") }
    assert_equal "negative numbers not allowed: -2", error.message

    error = assert_raises(Exception) { add("//;\n-1;2;-3;4") }
    assert_equal "negative numbers not allowed: -1, -3", error.message

    error = assert_raises(Exception) { add("//:\n1:-4: 2:   -54\n   122   : -21 : 11 \n-32:54 ") }
    assert_equal "negative numbers not allowed: -4, -54, -21, -32", error.message
  end

  private

  def add(string = nil)
    StringCalculator.add(string)
  end
end
