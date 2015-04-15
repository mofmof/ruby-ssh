require 'spec_helper'

# TODO sshアクセスするようなところのrspecはどうしたらいいんだろう net-ssh-shellを参考にしてみる
describe RubySSH do
  describe '' do
    it do
      # TODO hard coding
      Net::SSH.start('192.168.33.11', 'root', password: 'testpass') do |ssh|
        ssh.shell_runner do |runner|
          result = runner.exec('ls -l')
          puts result.stdout
          puts result.exit_status
          puts result.success?
          expect(true).to be_truthy
        end
      end
    end
  end
end
