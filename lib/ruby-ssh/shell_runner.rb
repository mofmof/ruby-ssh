module RubySSH
  class ShellRunner
    def initialize(session)
      @session = session
    end

    def exec(script)
      stdout, stderr, exit_status = nil
      @session.open_channel do |channel|
        channel.on_data do |ch, data|
          stdout = data
        end

        channel.on_extended_data do |ch, type, data|
          stderr = data
        end

        channel.send_channel_request 'shell' do |ch, success|
          if success
            ch.send_data(script)
            ch.process
            ch.eof!
          else
            p "channel request error"
          end
        end

        channel.on_request "exit-status" do |ch, data|
          exit_status = data.read_long
        end
      end
      @session.loop
      RubySSH::Result.new(stdout: stdout, stderr: stderr, exit_status: exit_status)
    end
  end
end
