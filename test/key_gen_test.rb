require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'
require './lib/key_gen'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_exists
    key_gen = KeyGenerator.new
    assert_instance_of KeyGenerator, key_gen
  end

  def test_key_generator_can_insert_key
    # skip
    key_gen = KeyGenerator.new
    assert_equal Fixnum, key_gen.generate_key
  end

  def test_key_has_to_be_a_fixnum
    key_gen = KeyGenerator.new
    assert_equal Fixnum, key_gen.key.class
  end

  def test_key_has_to_be_5_digits
    # skip
    key_gen = KeyGenerator.new
    key_gen.generate_key
    assert_equal 5, key_gen.key_count
  end

  def test_takes_2_sets_of_random_numbers
  end

  def test_can_section_things_into_4s
  end

end
