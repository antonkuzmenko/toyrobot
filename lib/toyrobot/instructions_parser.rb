module Toyrobot
  class InstructionsParser
    def parse(instructions)
      commands = Commands.constants(false).map do |name|
        const = Commands.const_get(name, false)
        arity = const.instance_method(:initialize).arity

        name = name.to_s.gsub(/Command\z/, '').upcase
        args = Array.new(arity) { /[^,\s]+/ }.join(',')
        regex = args.empty? ? /(#{name})/ : /(#{name}) (#{args})/

        [name, const, regex]
      end

      result_commands = []

      instructions.scan(/#{commands.map(&:last).join('|')}/) do |*args|
        command, attrs = args.flatten.compact

        if command
          result_commands << commands.find { |e| e.first == command }[1].new(*attrs.to_s.split(','))
        end
      end

      result_commands
    end
  end
end
