class CharacterMap

  def initialize
    @letters = letters
    @numbers = numbers
    @punctuation = punctuation
  end

  def letters
    @letters = ("a".."z").to_a
  end

  def numbers
    @numbers = ("0".."9").to_a
  end

  def punctuation
    @punctuation = [" ", ".", ",", "!", "\n"]
  end

  def whole_character_map
    
    whole = Array.new.push(@letters, @numbers, @punctuation).join.split("")

  end

end
