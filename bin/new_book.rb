#!/usr/bin/ruby

require 'fileutils'

if ARGV[0]
  @destination = ARGV[0]
else
  puts "Usage:\n"
  puts "new_book.rb path/to/copy/templates/to"
  exit
end

@base_dir = File.expand_path(File.dirname(__FILE__) + '/..')

puts "Creating templates..."
FileUtils.mkdir_p @destination
puts "Copying necessary files..."
FileUtils.cp_r File.join(@base_dir, 'templates'), @destination
FileUtils.cp_r File.join(@base_dir, 'lib'), @destination
FileUtils.cp_r File.join(@base_dir, 'bin'), @destination
FileUtils.cp 'config_sample.yml', File.join(@destination, 'config.yml')

puts "Done! Go to #{@destination} and edit config.yml and then run ./bin/gen_epub.rb from that directory."