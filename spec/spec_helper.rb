$LOAD_PATH.unshift File.expand_path(__FILE__.sub("spec/spec_helper.rb", "lib"))
require "monkey"

# I hate that code, but rbx for some reason ignores RUBYOPT.
begin
  require "rubygems"
rescue LoadError
end

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
