require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'
require './lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_map_has_letters
    character_map = CharacterMap.new
    assert_equal ["a", "b", "c", "d", "e", "f", "g",
                  "h", "i", "j", "k", "l", "m", "n",
                  "o", "p", "q", "r", "s", "t", "u",
                  "v", "w", "x", "y", "z"],
                  character_map.letters
  end

  def test_map_has_numbers
    character_map = CharacterMap.new
    assert_equal ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
                  character_map.numbers
  end

  def test_map_has_space_comma_and_period
    character_map = CharacterMap.new
    assert_equal [" ", ".", ","],
                  character_map.punctuation
  end

  def test_l_n_and_p_exist_together
    character_map = CharacterMap.new
    assert_equal ["a", "b", "c", "d", "e", "f", "g",
                  "h", "i", "j", "k", "l", "m", "n",
                  "o", "p", "q", "r", "s", "t", "u",
                  "v", "w", "x", "y", "z", "0", "1",
                  "2", "3", "4", "5", "6", "7", "8",
                  "9", " ", ".", ","], character_map
                  .whole_character_map
  end

end
