module Monkey

  Dir[File.dirname(__FILE__) + "/monkey/*.rb"].sort.each do |path|
    filename = File.basename(path, '.rb')
    require "monkey/#{filename}"
  end

  def self.backend=(backend)
    Backend.setup! backend
    backend
  end

  def self.backend
    Backend.backend
  end

end