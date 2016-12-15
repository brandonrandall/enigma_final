require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test

  def test_receives_a_date
    offset = Offset.new
    assert Date.today, offset
  end

  def test_can_square_given_date
    offset = Offset.new
    date = Date.today
    assert_equal "?", offset.square(date)
  end



end
