module Toyrobot
  class Game
    STEP_SIZE = 1

    attr_reader :table
    attr_accessor :robot

    def initialize(table_length: 4, table_width: 4)
      @table = Table.new(table_length, table_width)
      @robot = NilRobot.new
    end

    def handle_command(command)
      handler_name = command.class.name.split('::').last.gsub(/Command\z/, '')

      if CommandHandlers.const_defined?("#{handler_name}Handler", false)
        handler_class = CommandHandlers.const_get("#{handler_name}Handler", false)
        handler = handler_class.new(self)
        (handler.method(:call).arity == 1) ? handler.call(command) : handler.call
      end
    end

    def to_s
      robot.to_s
    end
  end
end
