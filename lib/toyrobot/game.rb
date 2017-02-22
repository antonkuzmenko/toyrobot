module Toyrobot
  class Game
    STEP_SIZE = 1

    attr_reader :table
    attr_accessor :robot

    def initialize(table_length: 4, table_width: 4)
      @table = Table.new(table_length, table_width)
    end

    def handle_command(instruction)
      command, *args = instruction.split(' ')

      if CommandHandlers.const_defined?("#{command.capitalize}Handler", false)
        handler_class = CommandHandlers.const_get("#{command.capitalize}Handler", false)
        handler = handler_class.new(self)
        args = args.flat_map { |e| e.split(',') }

        if handler.method(:call).arity == args.size
          handler.call(*args)
        end
      end
    end

    def to_s
      robot.nil? ? 'Unplaced' : robot.to_s
    end
  end
end
