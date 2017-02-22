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
      handler_name = handler_name(command)

      return unless handler_exists?(handler_name)

      handler = create_handler(handler_name)
      expects_command?(handler) ? handler.call(command) : handler.call
    end

    def to_s
      robot.to_s
    end

    private

    def handler_name(command)
      command.class.name.split('::').last.gsub(/Command\z/, '')
    end

    def handler_exists?(handler_name)
      CommandHandlers.const_defined?("#{handler_name}Handler", false)
    end

    def create_handler(handler_name)
      handler_class = CommandHandlers.const_get("#{handler_name}Handler", false)
      handler_class.new(self)
    end

    def expects_command?(handler)
      handler.method(:call).arity == 1
    end
  end
end
