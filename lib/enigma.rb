require './lib/character_map'
require './lib/key_gen'
require 'Date'

class Enigma
  attr_accessor :key, :date

  def initialize(key= nil, date= Date.today)
    @character_map = CharacterMap.new
    @key = key
    @date = date
    @last_four = last_four
  end

  def encrypt(message)
    @key = KeyGenerator.new.generate_key

    rotations
    last_four
    sum_key_and_offset
    produces_encrypted_message(message)
  end

  def decrypt(message)
    rotations
    last_four
    sum_key_and_offset
    produces_a_decrypted_message
  end

  def rotations
    @rotations = []
    @rotations << @key.to_s[0..1].to_i
    @rotations << @key.to_s[1..2].to_i
    @rotations << @key.to_s[2..3].to_i
    @rotations << @key.to_s[3..4].to_i
  end

  def last_four
    date = Date.today.strftime("%m%d%y")
    date_squared = (date.to_i ** 2)
    last_four_of_date_squared = date_squared
                                .to_s
                                .chars[-4..-1]
    @last_four = last_four_of_date_squared
                .map { |string| string.to_i }
  end

  def sum_key_and_offset
    @rotations
    @last_four.each_with_index.map do |last_four, index|
      last_four + @rotations[index]
    end
  end

  def produces_encrypted_message(message)
    chunks = chunk_unencrypted_message_to_fours(message)
    chunks.map do |chunk|
      chunk.each_with_index.map do |char, index|

        convert_characters_to_encrypted_characters(char, index)
      end
    end.join("")
  end

  def chunk_unencrypted_message_to_fours(message)
    message.chars.each_slice(4).to_a
  end

  def convert_characters_to_encrypted_characters(character, index)
    map = @character_map.whole_character_map

    downcased_char      = character.downcase
    index_of_character  = map.index(downcased_char)
    rotation_number     = sum_key_and_offset[index] + index_of_character
    final_index         = rotation_number % map.count
    map[final_index]
  end

  def produces_a_decrypted_message
    chunk_encrypted_message_to_fours.map do |chunk|
      chunk.each_with_index.map do |char, index|
        convert_characters_to_decrypted_characters(char, index)
      end
    end.join("")
  end

  def chunk_encrypted_message_to_fours
    @encrypted_message.chars.each_slice(4).to_a
  end

  def convert_characters_to_decrypted_characters(character, index)
    map = @character_map.whole_character_map

    index_of_character  = map.index(character)
    bw_key_and_offset   = generate_backwards_key_and_offset
    rotation_number     = bw_key_and_offset[index] + index_of_character
    final_index         = rotation_number % map.count
    map[final_index]
  end

  def generate_backwards_key_and_offset
    sum_key_and_offset.map { |number| number * -1 }
  end
end
