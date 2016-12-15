require 'pry'
require './lib/enigma'

class Encrypt

  attr_reader :message

  def initialize(input_file = ARGV[0], output = ARGV[1])
    @message = sanitize_message(File.read(input_file))
  end

  def sanitize_message(message)
    message.chomp
  end

  def start_encryption
    # binding.pry
    Enigma.new.encrypt(@message)
  end
end

# encrypt = Encrypt.new(ARGV[0])
# encrypt = File.read(ARGV[0]).chomp


# puts "Created '#{encrypt}' with the key 37293 and date 121016"






















# #read the input file
# # binding.pry
# input_filename = ARGV[0]
# unencrypted_message = File.read input_filename
#
# require './lib/enigma.rb'
#
# encrypted_message =
#   Enigma.new(unencrypted_message, 12344).encrypt
# #write the output file
# output_filename = ARGV[1]
# File.write output_filename, encrypted_message
# #print the file, key, and date
# puts "Created '#{output_filename}' with the key 37293 and date 121016"
