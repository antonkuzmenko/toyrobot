module Toyrobot
  class Game
    FACINGS = %w(NORTH EAST SOUTH WEST).freeze
    STEP_SIZE = 1
    TABLE_LENGTH = 4
    TABLE_WIDTH = 4

    attr_accessor :x, :y, :facing_index

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

    def report
      facing.empty? ? 'Unplaced' : "#{x},#{y},#{facing}"
    end

    def facing
      facing_index.nil? ? '' : FACINGS[facing_index]
    end
  end
end
