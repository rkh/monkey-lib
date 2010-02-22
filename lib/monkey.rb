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
    unless show_invisibles?
      from << caller.first if from.empty?
      from << __FILE__
      error.backtrace.reject! { |l| from.any? { |f| l.include? f } }
    end
    raise error
  end

  def self.show_invisibles?
    !!@show_invisibles
  end

  def self.show_invisibles!
    @show_invisibles = true
  end

  def self.hide_invisibles!
    @show_invisibles = false
  end

end