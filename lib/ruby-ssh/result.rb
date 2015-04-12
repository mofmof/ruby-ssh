module RubySSH
  class Result
    attr_reader :stdout, :exit_status

    def initialize(args = {})
      @stdout = args[:stdout]
      @exit_status = args[:exit_status]
    end
  end
end
