module Toyrobot
  class CommandsParser
    def parse(input)
      commands = input.each_line.map do |line|
        command_name, args = parse_line(line)
        create_command(command_name, args)
      end

      commands.compact
    end

    private

    def parse_line(line)
      command_name, args = line.split(' ').map(&:strip)
      [command_name, args&.split(',')]
    end

    def create_command(name, args)
      command_class(name).new(*args)
    rescue ArgumentError, NameError
    end

    def command_class(command)
      Commands.const_get("#{command.capitalize}Command", false)
    end
  end
end
