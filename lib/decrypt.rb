require 'pry'
require './lib/enigma'

class Decrypt

  attr_reader :message

  def initialize(input_file = ARGV[0], output = ARGV[1])
    @message = File.read(input_file)
    @provided_key = ARGV[2]
    @provided_date = ARGV[3]
    sanitize_message
  end

  def sanitize_message
    sanitize_message = @message.chomp
    start_decryption(sanitize_message)
  end

  def start_decryption(sanitize_message)
    enigma = Enigma.new(@provided_key, @provided_date)
    enigma.decrypt(sanitize_message)
  end
end

encrypt = File.read(ARGV[0]).chomp
