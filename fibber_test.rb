require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'fibber'

class FibberTest < Minitest::Test

  def setup

  end

  def test_fibber_exists
    assert Fibber
  end

  def test_the_fibonacci_sequence_for_zero_is_zero
    response = Fibber.fibonacci(0)
    assert_equal [0], response
  end

  def test_the_fibonacci_sequence_for_one_is_zero_then_one
    response = Fibber.fibonacci(1)
    assert_equal [0,1], response
  end

  def test_the_fibonacci_sequence_for_two_is_zero_one_one
    response = Fibber.fibonacci(2)
    assert_equal [0, 1, 1], response
  end

  def test_the_fibonacci_sequence_for_three_is_zero_one_one_two
    response = Fibber.fibonacci(3)
    assert_equal [0, 1, 1, 2], response
  end

  def test_the_fibonacci_sequence_for_four_is_zero_one_one_two_three
    response = Fibber.fibonacci(4)
    assert_equal [0, 1, 1, 2, 3], response
  end

  def test_the_fibonacci_sequence_for_five_is_zero_one_one_two_three_five
    response = Fibber.fibonacci(5)
    assert_equal [0, 1, 1, 2, 3, 5], response
  end

  def test_the_fibonacci_sequence_for_six_is_zero_one_one_two_three_five_eight
    response = Fibber.fibonacci(6)
    assert_equal [0, 1, 1, 2, 3, 5, 8], response
  end

  def test_the_output_of_the_jagged_method_with_one_row
    quantity = 3
    text = Fibber.output( quantity, 'jagged' )
    assert_equal "0 1 1 2\n", text
  end

  def test_the_output_of_the_jagged_method_with_two_rows
    quantity = 9
    text = Fibber.output( quantity, 'jagged' )
    assert_equal "0 1 1 2 3\n5 8 13 21 34\n", text
  end

  def test_the_output_of_the_better_method_with_one_row
    quantity = 3
    text = Fibber.output( quantity, 'better' )
    assert_equal "   0   1   1   2\n", text
  end

  def test_the_output_of_the_better_method_with_two_rows
    quantity = 9
    text = Fibber.output( quantity, 'better' )
    assert_equal "   0   1   1   2   3\n   5   8  13  21  34\n", text
  end

  def test_the_output_of_the_fancy_method_with_one_row
    quantity = 3
    text = Fibber.output( quantity, 'fancy' )
    assert_equal " 0 1 1 2\n", text
  end

  def test_the_output_of_the_fancy_method_with_two_rows
    quantity = 9
    text = Fibber.output( quantity, 'fancy' )
    assert_equal "  0  1  1  2  3\n  5  8 13 21 34\n", text
  end

end
