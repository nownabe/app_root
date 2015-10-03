module AppRoot
  class << self
    attr_writer :default_path

    def find_with_flag(flag)
      find_root_with_flag(flag, called_from)
    end
    alias_method :path, :find_with_flag

    def included(base)
      base.extend(ClassMethods)
    end

    private

    def called_from
      File.dirname(
        caller_locations.map do |l|
          l.absolute_path || l.path
        end.detect do |l|
          l !~ %r{lib/ruby/gems|app_root[\w.-]*/lib}
        end
      )
    end

    def default_path
      @default_path || Dir.pwd
    end

    def find_root_with_flag(flag, root_path)
      while root_path && File.directory?(root_path) && !File.exist?("#{root_path}/#{flag}")
        parent = File.dirname(root_path)
        root_path = parent != root_path && parent
      end

      root =
        if File.exist?("#{root_path}/#{flag}")
          root_path
        else
          default_path
        end

      Pathname.new(File.realpath(root))
    end
  end

  module ClassMethods
    def root
      AppRoot.find_with_flag(root_flag)
    end

    private

    def root_flag
      raise(NotImplementedError, "You must implement #{self}.#{__method__}")
    end
  end
end
