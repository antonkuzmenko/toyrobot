module Toyrobot
  module CommandHandlers
    class PlaceHandler < BaseHandler
      def call(x, y, direction)
        vector = Vector2D.new(x, y)
        return unless valid_vector?(vector)
        return unless valid_direction?(direction)

        game.robot = Robot.new(vector, Direction.new(direction), game.table)
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
