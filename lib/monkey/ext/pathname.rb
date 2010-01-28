require "pathname"

module Monkey
  module Ext
    module Pathname
      ##
      # @returns [Pathname, NilClass] Path with correct casing.
      def cased_path
        return unless exist?
        return Dir.chdir(self) { Pathname(Dir.pwd) } if File.directory? path
        files = Dir.chdir(dirname) { Dir.entries('.').select { |f| f.downcase == basename.to_s.downcase } }
        dirname.cased_path.join(files.size == 1 ? files.first : basename)
      end
    end
  end
end