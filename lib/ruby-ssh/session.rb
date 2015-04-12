module Net
  module SSH
    module Connection
      class Session
        # Provides a convenient way to initialize a shell given a Net::SSH
        # session. Yields the new shell if a block is given. Returns the shell
        # instance.
        def shell_runner
          runner = RubySSH::ShellRunner.new(self)
          yield runner if block_given?
          runner
        end
      end
    end
  end
end
