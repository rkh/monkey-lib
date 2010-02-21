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

  def self.invisible(*from)
    yield
  rescue Exception => error
    from << caller.first if from.empty?
    from << __FILE__
    error.backtrace.reject! { |l| from.any? { |f| l.include? f } }
    raise error
  end

end