module Toyrobot
  module CommandHandlers
    class PlaceHandler < BaseHandler
      def call(command)
        vector = Vector2D.new(command.x, command.y)
        return unless game.table.include?(vector)
        return unless valid_direction?(command.direction)

        game.robot = Robot.new(vector, Direction.new(command.direction), game.table)
      end

      private

      def valid_direction?(direction)
        Direction::DIRECTIONS.include?(direction)
      end
    end
  end
end
