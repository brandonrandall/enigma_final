require 'minitest/autorun'
require 'minitest/emoji'
require './lib/encrypt'
require './lib/key_gen'

class EncryptTest < Minitest::Test

  def test_if_enigma_exitsts
    skip
    enigma = Enigma.new("something")
    assert_instance_of Enigma, enigma
  end

  def test_can_create_key
    skip
    key_generator = KeyGenerator.new("something else")
    assert_instance_of KeyGenerator, key_generator
  end

  def test_enigma_can_input_a_file
    message = "./test/test_message.txt"
    encryptor = Encrypt.new(message)

    assert_equal String, encryptor.start_encryption.class
    assert_equal "Cooler message!".length, encryptor.start_encryption.length
  end

end
