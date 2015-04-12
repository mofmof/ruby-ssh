require 'spec_helper'

describe RubySSH do
  describe ".hoge" do
    it do
      # TODO hard coding
      Net::SSH.start('192.168.33.11', 'root', password: 'testpass') do |ssh|
        ssh.shell_runner do |runner|
          result = runner.exec('ld -l')
          puts result.stdout
          puts result.exit_status
          expect(true).to be_truthy
        end
      end
    end
  end
end
