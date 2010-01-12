module Monkey

  # Makes sure we always have RUBY_ENGINE, RUBY_ENGINE_VERSION and RUBY_DESCRIPTION
  # TODO: Check IronRuby version detection.
  module Engine

    def jruby?;    RUBY_ENGINE == "jruby";    end
    def mri?;      RUBY_ENGINE == "ruby";     end
    def rbx?;      RUBY_ENGINE == "rbx";      end
    def ironruby?; RUBY_ENGINE == "ironruby"; end
    def macruby?;  RUBY_ENGINE == "macruby";  end
    def maglev?;   RUBY_ENGINE == "maglev";   end

    alias rubinius? rbx?

    def ree?
      RUBY_DESCRIPTION =~ /Ruby Enterprise Edition/
    end

    module_function :jruby?
    module_function :mri?
    module_function :rbx?
    module_function :rubinius?
    module_function :ironruby?
    module_function :macruby?
    module_function :maglev?
    module_function :ree?
    
    def ruby_core?
      maglev? or rubinius?
    end
    
    module_function :ruby_core?

    include Rubinius if defined? Rubinius

    unless defined? RUBY_ENGINE
      if    defined? JRUBY_VERSION then ::RUBY_ENGINE = "jruby"
      elsif defined? Rubinius      then ::RUBY_ENGINE = "rbx"
      elsif defined? NSObject      then ::RUBY_ENINGE = "macruby"
      elsif defined? Maglev        then ::RUBY_ENINGE = "maglev"
      else                              ::RUBY_ENGINE = "ruby"
      end
    end

    unless RUBY_ENGINE.frozen?
      RUBY_ENGINE.replace "rbx" if RUBY_ENGINE == "rubinius"
      RUBY_ENGINE.downcase!
      RUBY_ENGINE.freeze
    end

    unless defined? RUBY_ENGINE_VERSION
      begin
        # ruby, jruby, macruby, some rubinius versions
        ::RUBY_ENGINE_VERSION = const_get("#{RUBY_ENGINE.upcase}_VERSION")
      rescue NameError
        # maglev, some rubinius versions
        ::RUBY_ENGINE_VERSION = const_get("VERSION")
      end
    end

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

    def ruby_engine(pretty = true)
      return RUBY_ENGINE unless pretty
      case RUBY_ENGINE
      when "ruby"   then ree? ? "Ruby Enterprise Edition" : "Ruby"
      when "rbx"    then "Rubinius"
      when "maglev" then "MagLev"
      else RUBY_ENGINE.capitalize.gsub("ruby", "Ruby")
      end
    end

    module_function :ruby_engine

  end
end