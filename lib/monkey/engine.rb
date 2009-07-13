module Monkey
  
  # Makes sure we always have RUBY_ENGINE, RUBY_ENGINE_VERSION and RUBY_DESCRIPTION
  module Engine

    include Rubinius if defined? Rubinius

    unless defined? RUBY_ENGINE
      if defined? JRUBY_VERSION
        ::RUBY_ENGINE = "jruby"
      elsif defined? Rubinius
        ::RUBY_ENGINE = "rbx"
      else
        ::RUBY_ENGINE = "ruby"
      end
    end

    unless RUBY_ENGINE.frozen?
      RUBY_ENGINE.replace "rbx" if RUBY_ENGINE == "rubinius"
      RUBY_ENGINE.downcase!
      RUBY_ENGINE.freeze
    end

    ::RUBY_ENGINE_VERSION = const_get("#{RUBY_ENGINE.upcase}_VERSION")

    unless defined? RUBY_DESCRIPTION
      ::RUBY_DESCRIPTION = "#{RUBY_ENGINE} #{RUBY_ENGINE_VERSION} "
      unless RUBY_ENGINE == "ruby"
        ::RUBY_DESCRIPTION << "(ruby #{RUBY_VERSION}"
        ::RUBY_DESCRIPTION << " patchlevel #{RUBY_PATCHLEVEL}" if defined? RUBY_PATCHLEVEL
        ::RUBY_DESCRIPTION << ") "
      end
      if defined? RUBY_RELEASE_DATE
        ::RUBY_DESCRIPTION << "("
        ::RUBY_DESCRIPTION << BUILDREV[0..8] << " " if defined? BUILDREV
        ::RUBY_DESCRIPTION << RUBY_RELEASE_DATE << ") "
      end
      ::RUBY_DESCRIPTION << "[#{RUBY_PLATFORM}]"
    end

    def jruby?
      RUBY_ENGINE == "jruby"
    end

    module_function :jruby?

    def mri?
      RUBY_ENGINE == "ruby"
    end

    module_function :mri?

    def rbx?
      RUBY_ENGINE == "rbx"
    end

    alias rubinius? rbx?
    module_function :rbx?
    module_function :rubinius?

    def ironruby?
      RUBY_ENGINE == "ironruby"
    end

    module_function :ironruby?

    def macruby?
      RUBY_ENGINE == "macruby"
    end

    module_function :macruby?

    def ruby_engine(pretty = true)
      return RUBY_ENGINE unless pretty
      case RUBY_ENGINE
      when "ruby"  then "CRuby"
      when "rbx"   then "Rubinius"
      when /ruby$/ then RUBY_ENGINE.capitalize.gsub("ruby", "Ruby")
      end
    end

    module_function :ruby_engine

  end
  
  extend Engine
  include Engine

end