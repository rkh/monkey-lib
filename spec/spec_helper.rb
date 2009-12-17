$LOAD_PATH.unshift File.expand_path(__FILE__.sub("spec/spec_helper.rb", "lib"))
require "monkey"

if ENV['BACKEND'] and not ENV['BACKEND'].empty?
  puts "Using #{ENV['BACKEND']} (#{ENV['BACKEND_SETUP']} setup mode)"
  case ENV['BACKEND_SETUP']
  when "autodetect" then require ENV['BACKEND']
  when "explicit" then Monkey.backend = ENV['BACKEND']
  else
    puts "Please set BACKEND_SETUP."
    exit 1
  end
end
