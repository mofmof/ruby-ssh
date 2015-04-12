require 'net/ssh'
require "ruby-ssh/version"
require "ruby-ssh/session"
require "ruby-ssh/shell_runner"
require "ruby-ssh/result"

=begin
module RubySSH
  def self.start(host, user, options = {}, &block)
    Net::SSH::start(host, user, options) do |ssh|
      p ssh.exec!('ls ~')
      #yield
    end
  end
end
=end
