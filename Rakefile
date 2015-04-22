require "bundler/gem_tasks"
require 'ruby-ssh'

HOST = '192.168.33.11'
USER = 'root'
PASSWORD = 'testpass'

# for development tasks
namespace :dev do
  task :start do
    RubySSH.start(HOST, USER, password: PASSWORD) do |ssh|
      ssh.shell_runner do |runner|
        result = runner.exec('ls -l')
        puts result.stdout
        puts result.exit_status
        puts result.success?
      end
    end
  end

  task :run do
    result = RubySSH.run(HOST, USER, password: 'testpass', script: 'ls')
    puts result.success?
  end

  task :run_with_key do
    # TODO 失敗時に標準出力がかえらない
    result = RubySSH.run(HOST, 'biscuits_d5df0fdd', keys: ['~/.ssh/biscuits_keys/514bff4fecccf277'], script: 'sudo sshd -T')
    puts result.stdout
    puts result.success?
  end
end
