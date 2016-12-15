class KeyGenerator

  attr_accessor :key

  def initialize
    @key = nil
    generate_key
  end

  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    @key = key.join.to_i
  end

  def key_count
    @key
  end



end
