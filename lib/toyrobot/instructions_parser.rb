module Toyrobot
  class InstructionsParser
    Instruction = Struct.new(:name, :command_class, :regexp)

    private_constant :Instruction

    def parse(input)
      instructions = create_instructions
      commands = []

      input.scan(/#{regexps(instructions)}/) do |*args|
        instruction_name, attributes = args.flatten.compact
        next unless instruction_name

        instruction = find_instruction(instruction_name, instructions)
        commands << instruction.command_class.new(*attributes.to_s.split(','))
      end

      commands
    end

    private

    def create_instructions
      Commands.constants(false).map do |class_name|
        command_class = command_class(class_name)
        class_name = instruction_name(class_name)
        args = arguments_regexp(command_class)
        regexp = args.empty? ? /(#{class_name})/ : /(#{class_name}) (#{args})/

        Instruction.new(class_name, command_class, regexp)
      end
    end

    def command_class(class_name)
      Commands.const_get(class_name, false)
    end

    def instruction_name(class_name)
      class_name.to_s.gsub(/Command\z/, '').upcase
    end

    def arguments_regexp(command_class)
      Array.new(arguments_count(command_class)) { /[^,\s]+/ }.join(',')
    end

    def arguments_count(command_class)
      arity = command_class.instance_method(:initialize).arity
      arity < 0 ? 0 : arity
    end

    def regexps(instructions)
      instructions.map(&:regexp).join('|')
    end

    def find_instruction(instruction_name, instructions)
      instructions.find { |e| e.first == instruction_name }
    end
  end
end
