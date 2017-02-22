module Toyrobot
  module CommandHandlers
    class PlaceHandler < BaseHandler
      def call(command)
        vector = Vector2D.new(command.x, command.y)
        return unless valid_vector?(vector)
        return unless valid_direction?(command.direction)

        game.robot = Robot.new(vector, Direction.new(command.direction), game.table)
      end

      private

      def valid_vector?(vector)
        game.table.include?(vector)
      end

      def valid_direction?(direction)
        Direction::DIRECTIONS.include?(direction)
      end
    end
  end
end
