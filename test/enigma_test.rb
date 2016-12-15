require './lib/enigma'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_key_defaults_to_nil
    enigma = Enigma.new
    message = "Hi"
    assert_equal nil, enigma.key
  end

  def test_if_enigma_accepts_only_message_and_key
    enigma = Enigma.new(66778)
    assert_equal 66778, enigma.key
  end
  #
  def test_if_enigma_accepts_only_message_and_date
    enigma = Enigma.new(nil, 141216)
    assert_equal 141216, enigma.date
  end

  def test_it_receives_squared_and_takes_last_4_of_date
    enigma = Enigma.new
    assert_equal [8, 2, 5, 6], enigma.last_four
  end

  def test_it_can_have_a_rotation
  end

  def test_stuff_can_be_chunked_into_4s
    enigma = Enigma.new
    message = "cool message!"
    assert_equal [["c", "o", "o", "l"],
                  [" ", "m", "e", "s"],
                  ["s", "a", "g", "e"],
                  ["!"]], enigma.chunk_unencrypted_message_to_fours(message)
  end

  def test_key_can_be_added_to_offset
    enigma = Enigma.new(55555)
    enigma.encrypt("cool message!")

    assert_equal Array, enigma.sum_key_and_offset.class
    assert_equal 4, enigma.sum_key_and_offset.count
  end

  def test_chunks_word_will_always_return_a_char_object

  end

  def test_produces_encrypted_message
    skip
    enigma = Enigma.new(12345)
    message = "cool message!"
    assert_equal "t.mvm9c29xeop", enigma.produces_encrypted_message(message)
  end

  def test_it_can_encrypt
    enigma = Enigma.new(54321)
    message = "cool message!"
    assert_equal String, enigma.encrypt(message).class
    assert_equal message.length, enigma.encrypt(message).length
  end

  def test_it_can_decrypt
    skip
    assert_equal "cool message!", enigma.produces_a_decrypted_message(message)
  end
end
