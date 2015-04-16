require 'net/ssh'
require "ruby-ssh/version"
require "ruby-ssh/session"
require "ruby-ssh/shell_runner"
require "ruby-ssh/result"

module RubySSH
  class << self
    def start(host, user, options = {}, &block)
      Net::SSH.start(host, user, options) do |ssh|
        yield ssh
      end
    end

    def run(host, user, options = {})
      script = options.delete(:script)

      result = nil  # TODO 明示的に初期化したくない
      Net::SSH.start(host, user, options) do |ssh|
        ssh.shell_runner do |runner|
          result = runner.exec(script)
        end
      end
      result
    end
  end
end
